class Ots < Formula
  desc "OpenType Sanitiser parses validates & sanitizes OpenType & WOFF2 font files"
  homepage "https://github.com/khaledhosny/ots"
  url "https://github.com/khaledhosny/ots/releases/download/v7.1.8/ots-7.1.8.tar.xz"
  sha256 "7e0e3233e7cb07073a48d48fbfccf7a09b1b68fdd60189213c0cf76f59bd2bec"

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
