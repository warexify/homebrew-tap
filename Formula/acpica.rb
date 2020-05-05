class Acpica < Formula
  desc "OS-independent implementation of the ACPI specification"
  homepage "https://www.acpica.org/"
  url "https://acpica.org/sites/acpica/files/acpica-unix-20200430.tar.gz"
  sha256 "f124ab6e99110a192864b23dc6911d180968dd15b49f95f7adc37d69dd14621a"
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
