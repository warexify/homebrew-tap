class Ots < Formula
  desc "OpenType Sanitiser parses validates & sanitizes OpenType & WOFF2 font files"
  homepage "https://github.com/khaledhosny/ots"
  url "https://github.com/khaledhosny/ots/releases/download/v8.0.0/ots-8.0.0.tar.xz"
  sha256 "00aed968f88d492bc42e9ddb941bda9502267d54c51021ad071b51effaa0401a"

  head "https://github.com/khaledhosny/ots.git"

  bottle :unneeded

  depends_on "meson-internal" => :build
  depends_on "ninja"
  depends_on "python"

  def install
    system "meson", "--strip", "-Ddebug=true", "--prefix=#{prefix}", "--bindir=#{bin}", "build"
    system "ninja", "-C", "build", "install"
  end

  test do
    system "ots-sanitize", "--version"
  end
end
