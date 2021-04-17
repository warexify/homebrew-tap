class Acpica < Formula
  desc "OS-independent implementation of the ACPI specification"
  homepage "https://www.acpica.org/"
  url "https://acpica.org/sites/acpica/files/acpica-unix-20210331.tar.gz"
  sha256 "b49237a2c3df58b57310612ec3a6ebee69e1a525b5efeec7152faf32a03b7068"
  head "https://github.com/acpica/acpica.git"

  bottle :unneeded

  depends_on "bison" => :build
  depends_on "flex" => :build
  depends_on "gcc" => :build

  def install
    ENV.deparallelize
    ENV["CFLAGS"] = "-mmacosx-version-min=10.7 -O3"
    ENV["LDFLAGS"] = "-mmacosx-version-min=10.7"
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/iasl", "-h"
  end
end
