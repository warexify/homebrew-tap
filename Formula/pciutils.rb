class Pciutils < Formula
  desc "The PCI Utilities package contains a library for portable access to PCI bus configuration registers and several utilities based on this library."
  homepage "https://github.com/warexify/pciutils"
  url "https://github.com/warexify/pciutils/archive/pciutils-3.2.2.tar.gz"
  sha256 "0e28550269ff53953e6f565582b46d49f269a589e1e5c2889a442af2ea9d2916"

  bottle :unneeded

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
