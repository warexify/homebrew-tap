class Mtoc < Formula
  desc "Mach-O to PE/COFF binary converter"
  homepage "https://opensource.apple.com/source/cctools/cctools-973.0.1/"
  url "https://opensource.apple.com/tarballs/cctools/cctools-973.0.1.tar.gz"
  version "973.0.1"
  sha256 "affeadb32c9f8b747fd1c2e5fa537f07d65a39a545f99eef27ac63e0bcd28224"

  livecheck do
    url "https://opensource.apple.com/tarballs/cctools/"
    regex(/href=.*?cctools[._-]v?(\d+(?:\.\d+)*)\.t/i)
  end

  bottle :unneeded

  depends_on "llvm" => :build

  patch do
    url "https://raw.githubusercontent.com/acidanthera/ocbuild/d3e57820ce85bc2ed4ce20cc25819e763c17c114/patches/mtoc-permissions.patch"
    sha256 "0d20ee119368e30913936dfee51055a1055b96dde835f277099cb7bcd4a34daf"
  end

  def install
    inreplace "xcode/libstuff.xcconfig", "HEADER_SEARCH_PATHS = ${inherited} ${DT_TOOLCHAIN_DIR}/usr/local/include",
"HEADER_SEARCH_PATHS = ${inherited} ${DT_TOOLCHAIN_DIR}/usr/local/include /usr/local/opt/llvm/include"
    xcodebuild "-configuration", "Release", "-target", "efi install", "SYMROOT=build"
    system "strip", "-x", "build/Release/mtoc"
    system "strip", "-x", "build/Release/mtor"
    bin.install "build/Release/mtoc"
    bin.install "build/Release/mtor"
    man1.install "man/mtoc.1"
    man1.install "man/mtor.1"
  end

  test do
    (testpath/"test.c").write <<~EOS
      __attribute__((naked)) int start() {}
    EOS

    args = %W[
      -nostdlib
      -Wl,-preload
      -Wl,-e,_start
      -seg1addr 0x1000
      -o #{testpath}/test
      #{testpath}/test.c
    ]
    system "cc", *args
    system "#{bin}/mtoc", "#{testpath}/test", "#{testpath}/test.pe"
  end
end
