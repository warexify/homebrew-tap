require "base64"

class Sfnt2woffZopfli < Formula
  desc "WOFF utilities with Zopfli compression"
  homepage "https://github.com/bramstein/sfnt2woff-zopfli"
  url "https://github.com/bramstein/sfnt2woff-zopfli/archive/v1.1.0.tar.gz"
  sha256 "86deae57d0bd0eb395f2797c370613e62c1f33dd86626a21e309b154c98efa6b"

  bottle :unneeded

  def install
    system "make"
    bin.install "sfnt2woff-zopfli"
    bin.install "woff2sfnt-zopfli"
  end

  test do
    system "sfnt2woff-zopfli"
  end
end
