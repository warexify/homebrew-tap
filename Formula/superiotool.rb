class Superiotool < Formula
  desc "Identify, read, write, verify, and erase Super I/O chips"
  homepage "https://coreboot.org/"
  url "https://github.com/warexify/superiotool/archive/superiotool-4.5.tar.gz"
  sha256 "feda3f93ccdc08da7b08c575831568dfa42b0e3ba5cdaf7ae2aed99bda5a335d"

  depends_on "directhw"
  depends_on "pciutils"

  def install
    system "make", "DESTDIR=#{prefix}", "PREFIX=/", "install"
    mv sbin, bin
  end

  test do
    system "#{bin}/superiotool" " --version"
  end
end
