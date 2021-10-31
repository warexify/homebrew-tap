class Swift < Formula
  desc "High-performance system programming language"
  homepage "https://swift.org"
  # NOTE: Keep version in sync with resources below
  url "https://github.com/apple/swift/archive/swift-5.4.2-RELEASE.tar.gz"
  sha256 "df36ef943e0759b602d36d538e0f19db60a1b56b01f6b8bff2564313f665a183"
  license "Apache-2.0"
  revision 1

  livecheck do
    url "https://swift.org/download/"
    regex(/Releases<.*?>Swift v?(\d+(?:\.\d+)+)</im)
  end

  keg_only :provided_by_macos

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  depends_on xcode: :build

  uses_from_macos "icu4c"

  resource "llvm-project" do
    url "https://github.com/apple/llvm-project/archive/swift-5.4.2-RELEASE.tar.gz"
    sha256 "50401b5b696292ccf6dc11f59f34f8958fdc0097c7d4db9cd862a4622ee1676a"
  end

  resource "cmark" do
    url "https://github.com/apple/swift-cmark/archive/swift-5.4.2-RELEASE.tar.gz"
    sha256 "d1c2d9728667a563e9420c608ef4fcde749a86e38ee373e8b109bce5eb94510d"
  end

  resource "llbuild" do
    url "https://github.com/apple/swift-llbuild/archive/swift-5.4.2-RELEASE.tar.gz"
    sha256 "d5562e63fd68f6fcd64c60820a1be0142592a2742c71c1c6fe673f34854ac599"
  end

  resource "swiftpm" do
    url "https://github.com/apple/swift-package-manager/archive/swift-5.4.2-RELEASE.tar.gz"
    sha256 "3648d7cbf74a2ad69b444d78b53e278541b1bd0e4e54fb1b8bc9002596bbaf4b"
  end

  resource "indexstore-db" do
    url "https://github.com/apple/indexstore-db/archive/swift-5.4.2-RELEASE.tar.gz"
    sha256 "876f170ecbce1461cc21509a52d11b4e79a045f6348e0d8f1c643e9e6e0e1624"
  end

  resource "sourcekit-lsp" do
    url "https://github.com/apple/sourcekit-lsp/archive/swift-5.4.2-RELEASE.tar.gz"
    sha256 "2eff815309fa34bcb18a70298e16deb974862806a449c93eb245162030fe4d73"
  end

  def install
    workspace = buildpath.parent
    build = workspace/"build"

    toolchain_prefix = "/Swift-#{version}.xctoolchain"
    install_prefix = "#{toolchain_prefix}/usr"

    ln_sf buildpath, workspace/"swift"
    resources.each { |r| r.stage(workspace/r.name) }

    mkdir build do
      # List of components to build
      swift_components = %w[
        compiler clang-resource-dir-symlink stdlib sdk-overlay
        tools editor-integration toolchain-tools license
        sourcekit-xpc-service swift-remote-mirror
        swift-remote-mirror-headers parser-lib
      ]
      llvm_components = %w[
        llvm-cov llvm-profdata IndexStore clang
        clang-resource-headers compiler-rt clangd
      ]

      args = %W[
        --release --assertions
        --no-swift-stdlib-assertions
        --build-subdir=#{build}
        --llbuild --swiftpm
        --indexstore-db --sourcekit-lsp
        --jobs=#{ENV.make_jobs}
        --verbose-build
        --
        --workspace=#{workspace}
        --install-destdir=#{prefix}
        --toolchain-prefix=#{toolchain_prefix}
        --install-prefix=#{install_prefix}
        --host-target=macosx-x86_64
        --stdlib-deployment-targets=macosx-x86_64
        --build-swift-dynamic-stdlib
        --build-swift-dynamic-sdk-overlay
        --build-swift-stdlib-unittest-extra
        --install-swift
        --swift-install-components=#{swift_components.join(";")}
        --llvm-install-components=#{llvm_components.join(";")}
        --install-llbuild
        --install-swiftpm
        --install-sourcekit-lsp
      ]

      system "#{workspace}/swift/utils/build-script", *args
    end
  end

  def caveats
    <<~EOS
      The toolchain has been installed to:
        #{opt_prefix}/Swift-#{version}.xctoolchain

      You can find the Swift binary at:
        #{opt_prefix}/Swift-#{version}.xctoolchain/usr/bin/swift

      You can also symlink the toolchain for use within Xcode:
        ln -s #{opt_prefix}/Swift-#{version}.xctoolchain ~/Library/Developer/Toolchains/Swift-#{version}.xctoolchain
    EOS
  end

  test do
    (testpath/"test.swift").write <<~'EOS'
      let base = 2
      let exponent_inner = 3
      let exponent_outer = 4
      var answer = 1

      for _ in 1...exponent_outer {
        for _ in 1...exponent_inner {
          answer *= base
        }
      }

      print("(\(base)^\(exponent_inner))^\(exponent_outer) == \(answer)")
    EOS
    output = shell_output("#{prefix}/Swift-#{version}.xctoolchain/usr/bin/swift -v test.swift")
    assert_match "(2^3)^4 == 4096\n", output
  end
end
