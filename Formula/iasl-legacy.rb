class IaslLegacy < Formula
  desc "OS-independent implementation of the ACPI specification"
  homepage "https://www.acpica.org/"
  url "https://acpica.org/sites/acpica/files/acpica-unix-20120711.tar.gz"
  sha256 "f065b3804a1c6f67fbea5a95cda8ad99e0ae0ac3d743f5b7632f7e47f399d44d"

  bottle :unneeded

  depends_on "gcc@6" => :build
  depends_on "flex" => :build
  depends_on "bison" => :build

  def install
    ENV.deparallelize
    ENV["CC"] = "gcc-6"
    inreplace "generate/unix/Makefile.config", "cp --remove-destination", "cp"
    system "make", "iasl", "CC=#{ENV.cc}"
    bin.install "generate/unix/bin64/iasl" => "iasl-legacy"
  end

  test do
    system "#{bin}/iasl-legacy", "-h"
  end
end
