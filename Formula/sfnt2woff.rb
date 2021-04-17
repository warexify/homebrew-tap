class Sfnt2woff < Formula
  desc "Convert existing TrueType/OpenType fonts to WOFF format"
  homepage "https://github.com/bramstein/sfnt2woff"
  url "https://github.com/warexify/sfnt2woff/archive/v1.0.0.tar.gz"
  version "2009-10-04"
  sha256 "825e18d2c3f04f364cc9b37b27b492321942edd74f396d323607b06abe75067a"

  bottle :unneeded

  def install
    system "make"
    bin.install "sfnt2woff"
    bin.install "woff2sfnt"
  end
end
