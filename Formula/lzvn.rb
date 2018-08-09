class Lzvn < Formula
  desc "C-Style conversion of lzvn_decode"
  homepage "https://github.com/Piker-Alpha/LZVN"
  head "https://github.com/Piker-Alpha/LZVN.git"

  bottle :unneeded

  def install
    system "make", "lzvn"
    bin.install "lzvn"
  end
end
