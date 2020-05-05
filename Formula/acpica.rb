class Acpica < Formula
  desc "OS-independent implementation of the ACPI specification"
  homepage "https://www.acpica.org/"
  url "https://acpica.org/sites/acpica/files/acpica-unix-20200430.tar.gz"
  sha256 "fb807f1dec31664f972af37d213abf72987afe33abf68c83051e298da35d297c"
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
