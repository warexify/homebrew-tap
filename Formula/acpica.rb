class Acpica < Formula
  desc "OS-independent implementation of the ACPI specification"
  homepage "https://www.acpica.org/"
  url "https://acpica.org/sites/acpica/files/acpica-unix-20210105.tar.gz"
  sha256 "a9be7b749025e60f93fde2fe531bfe0d84a33641d3e0c9b0f6049f996dbb1ff8"
  head "https://github.com/acpica/acpica.git"

  bottle :unneeded

  depends_on "gcc" => :build
  depends_on "flex" => :build
  depends_on "bison" => :build

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
