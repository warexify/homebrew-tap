class Csrstat < Formula
  desc "Command-line tool to get the active System Integrity Protection status"
  homepage "https://github.com/Piker-Alpha/csrstat"
  url "https://github.com/warexify/csrstat/archive/v2.0.tar.gz"
  sha256 "ade315aedb55070379d6104f20bfdca4840d7672486e59c665f4f4f12821ad39"
  head "https://github.com/warexify/csrstat.git"

  def install
    system "make", "csrstat"
    bin.install "csrstat"
  end
end
