class Acpica < Formula
  desc "OS-independent implementation of the ACPI specification"
  homepage "https://www.acpica.org/"
  url "https://acpica.org/sites/acpica/files/acpica-unix-20201217.tar.gz"
  sha256 "df6bb667c60577c89df5abe3270539c1b9716b69409d1074d6a7fc5c2fea087b"
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
