class Ttf2eot < Formula
  desc "Very small utility to convert TTF files to EOT"
  homepage "https://github.com/wget/ttf2eot"
  url "https://github.com/wget/ttf2eot/archive/v0.0.3.tar.gz"
  sha256 "f363c4f2841b6d0b0545b30462e3c202c687d002da3d5dec7e2b827a032a3a65"

  bottle :unneeded

  def install
    system "make"
    bin.install "ttf2eot"
  end
end
