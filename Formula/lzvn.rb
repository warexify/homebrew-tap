class Lzvn < Formula
  desc "C-Style conversion of lzvn_decode"
  homepage "https://github.com/Piker-Alpha/LZVN"
  url "https://github.com/warexify/LZVN/archive/v0.1.tar.gz"
  sha256 "724b909676a7e069a403c61175d3b77c6ff2b6c301461332af1e4e4018084d28"
  head "https://github.com/Piker-Alpha/LZVN.git"

  def install
    system "make", "lzvn"
    bin.install "lzvn"
  end
end
