class Superiotool < Formula
  desc "Identify, read, write, verify, and erase Super I/O chips"
  homepage "https://coreboot.org/"
  url "https://github.com/warexify/superiotool/archive/superiotool-4.5.tar.gz"
  sha256 "68a0898861242817207b1412afd99fcb2413399bedb509e10624441fff9d9191"

  bottle :unneeded

  def install
    system "make", "DESTDIR=#{prefix}", "PREFIX=/", "install"
    mv sbin, bin
  end

  test do
    system "#{bin}/superiotool" " --version"
  end
end
