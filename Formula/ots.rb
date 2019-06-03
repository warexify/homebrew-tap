class Ots < Formula
  desc "OpenType Sanitiser parses validates & sanitizes OpenType & WOFF2 font files"
  homepage "https://github.com/khaledhosny/ots"
  url "https://github.com/khaledhosny/ots/releases/download/v7.1.9/ots-7.1.9.tar.xz"
  sha256 "dc1e4847d7cab473b95d274aa11ec85a3553d999fc97ff6fb686d5c69919c830"

  head "https://github.com/khaledhosny/ots.git"

  bottle :unneeded

  depends_on "python"
  depends_on "ninja"
  depends_on "meson-internal" => :build

  def install
    system "meson", "--strip", "-Ddebug=true", "--prefix=#{prefix}", "--bindir=#{prefix}/bin", "build"
    system "ninja", "-C", "build", "install"
  end

  test do
    system "ots-sanitize", "--version"
  end
end
