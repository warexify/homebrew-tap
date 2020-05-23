class Flashrom < Formula
  desc "Identify, read, write, verify, and erase flash chips"
  homepage "https://flashrom.org/"
  url "https://github.com/warexify/flashrom/archive/v1.3.tar.gz"
  sha256 "e846d2483f945a7f9c6c5cd59f086b8d709b640fb6b40f07deaae5842e77cc71"
  head "https://review.coreboot.org/flashrom.git"

  bottle :unneeded

  depends_on "pkg-config" => :build
  depends_on "libftdi0"
  depends_on "libusb-compat"
  depends_on "directhw"
  depends_on "pciutils"

  def install
    ENV["CONFIG_PRINT_WIKI"] = "1"
    system "make", "DESTDIR=#{prefix}", "PREFIX=/", "install"
    mv sbin, bin
  end

  test do
    system "#{bin}/flashrom" " --version"
  end
end