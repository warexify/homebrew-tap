class Acpica < Formula
  desc "OS-independent implementation of the ACPI specification"
  homepage "https://www.acpica.org/"
  url "https://acpica.org/sites/acpica/files/acpica-unix-20181031.tar.gz"
  sha256 "090e75cf2a6bc53dc93a82822ae74962942bc66d3932a00ed130e640b3a3e1ff"
  head "https://github.com/acpica/acpica.git"

  bottle :unneeded

  def install
    ENV.deparallelize
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/acpihelp", "-u"
  end
end
