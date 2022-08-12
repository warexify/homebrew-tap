class Pciutils < Formula
  desc "Library for portable access to PCI bus configuration registers"
  homepage "https://github.com/warexify/pciutils-osx"
  url "https://github.com/warexify/pciutils-osx/archive/v3.7.0.tar.gz"
  sha256 "410be929441a4994b61f4e52af1970683e923daf8bc64b26910738ca28b1f670"

  depends_on "directhw"

  def install
    ENV.deparallelize
    system "make"
    system "make", "install", "DESTDIR=#{prefix}", "PREFIX=/"
    system "make", "install-lib", "DESTDIR=#{prefix}", "PREFIX=/"
    mv sbin, bin
  end

  test do
    system "false"
  end
end
