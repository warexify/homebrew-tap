class Ots < Formula
  desc "OpenType Sanitiser parses validates & sanitizes OpenType & WOFF2 font files"
  homepage "https://github.com/khaledhosny/ots"
  url "https://github.com/khaledhosny/ots/releases/download/v8.1.4/ots-8.1.4.tar.xz"
  sha256 "f21b927b03248e392e416c765eea4940c21a4e82f09045bc893b141eb57f1e29"

  head "https://github.com/khaledhosny/ots.git"

  depends_on "meson" => :build
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
