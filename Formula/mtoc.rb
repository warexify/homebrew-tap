class Mtoc < Formula
  desc "Convert a Mach-O file to a PECOFF file"
  homepage "https://opensource.apple.com/"
  url "https://opensource.apple.com/tarballs/cctools/cctools-921.tar.gz"
  version "921"
  sha256 "53449a7f2e316c7df5e6b94fd04e12b6d0356f2487d77aad3000134e4c010cc5"

  bottle :unneeded

  option "with-llvm", "Build with LTO support"
  depends_on "llvm" => :optional

  def install
    ENV.deparallelize

    args = %W[
      BUILD_DYLIBS=NO
      CC=#{ENV.cc}
      CXX=#{ENV.cxx}
      DSTROOT=#{prefix}
      LTO=#{"-DLTO_SUPPORT" if build.with? "llvm"}
      RC_CFLAGS=#{ENV.cflags}
      RC_OS="macos"
      RC_ProjectSourceVersion=#{version}
      TRIE=
      USE_DEPENDENCY_FILE=NO
    ]

    args << "SDK=-std=gnu99"

    archs = if Hardware::CPU.intel?
      "i386 x86_64"
    else
      "ppc i386 x86_64"
    end

    args << "RC_ARCHS=#{archs}"
    cd("libstuff") do
      system "make", "EFITOOLS=efitools", *args
    end
    cd("efitools") do
      system "make", *args
      bin.install "mtoc.NEW" => "mtoc"
    end
    man.mkpath
    man1.install "man/mtoc.1"
  end

  test do
    system "#{bin}/mtoc"
  end
end
