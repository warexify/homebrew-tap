class Mtoc < Formula
  desc "Convert a Mach-O file to a PECOFF file"
  homepage "https://opensource.apple.com/"
  url "https://opensource.apple.com/tarballs/cctools/cctools-895.tar.gz"
  sha256 "ce66034fa35117f9ae76bbb7dd72d8068c405778fa42e877e8a13237a10c5cb7"
  version "895"

  def install
    cd("libstuff") do
      system "make", "EFITOOLS=efitools", "LTO="
    end
    cd("efitools") do
      system "make"
      bin.install "mtoc.NEW" => "mtoc"
    end
    man.mkpath
    man1.install "man/mtoc.1"
  end

  test do
    system "#{bin}/mtoc"
  end
end
