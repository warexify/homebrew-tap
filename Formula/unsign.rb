class Unsign < Formula
  desc "Remove code signatures from OSX Mach-O binaries"
  homepage "http://www.woodmann.com/collaborative/tools/index.php/Unsign"
  url "https://github.com/warexify/unsign/archive/v0.1.tar.gz"
  sha256 "e2f12859931a635319e17ea383fda37a858f5f77b8833ca308a5f5d5ae9a3f7f"
  head "https://github.com/steakknife/unsign.git"

  def install
    system "make"
    bin.install "unsign"
  end

  test do
    system "#{bin}/unsign", "-h"
  end
end
