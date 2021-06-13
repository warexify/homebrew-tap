class Acpica < Formula
  desc "OS-independent implementation of the ACPI specification"
  homepage "https://www.acpica.org/"
  url "https://acpica.org/sites/acpica/files/acpica-unix-20210604.tar_0.gz"
  sha256 "aafe6e0128723599cdaebb636a798db11b1b6da686fcef7d381068837ad74cb1"
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
