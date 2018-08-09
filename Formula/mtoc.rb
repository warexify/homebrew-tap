class Mtoc < Formula
  desc "Convert a Mach-O file to a PECOFF file"
  homepage "https://opensource.apple.com/"
  url "https://opensource.apple.com/tarballs/cctools/cctools-895.tar.gz"
  sha256 "ce66034fa35117f9ae76bbb7dd72d8068c405778fa42e877e8a13237a10c5cb7"
  version "895"

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

    if Hardware::CPU.intel?
      archs = "i386 x86_64"
    else
      archs = "ppc i386 x86_64"
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
