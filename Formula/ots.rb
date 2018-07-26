class Ots < Formula
  desc "OpenType Sanitiser parses validates & sanitizes OpenType & WOFF2 font files"
  homepage "https://github.com/khaledhosny/ots"
  url "https://github.com/khaledhosny/ots/releases/download/v7.1.7/ots-7.1.7.tar.xz"
  version "7.1.7"
  sha256 "4cd2ab175b40363b5708d0246aa3acf65a21f5934879082c081502cf46675703"

  head "https://github.com/khaledhosny/ots.git"

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
