class Pciutils < Formula
  desc "Library for portable access to PCI bus configuration registers"
  homepage "https://github.com/warexify/pciutils"
  url "https://github.com/warexify/pciutils/archive/pciutils-3.6.5.tar.gz"
  sha256 "6a05512aad50e2b5aa47ae0346b91c4c406b808e56246d1b3caae5f2182bf121"

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
