class Acpica < Formula
  desc "OS-independent implementation of the ACPI specification"
  homepage "https://www.acpica.org/"
  url "https://acpica.org/sites/acpica/files/acpica-unix-20200717.tar.gz"
  sha256 "cb99903ef240732f395af40c23b9b19c7899033f48840743544eebb6da72a828"
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
