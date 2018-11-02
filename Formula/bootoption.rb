class Bootoption < Formula
  desc "Command line utility for managing a firmware's boot menu"
  homepage "https://github.com/vulgo/bootoption/"
  url "https://github.com/vulgo/bootoption/archive/v0.2.11.tar.gz"
  sha256 "1479d64f06eebede2a3e54afc2571f443b076785f6cfa6ec61b04dc4dbcd3a0d"
  head "https://github.com/vulgo/bootoption.git"

  bottle :unneeded

  depends_on :xcode => ["9.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "-Xswiftc", "-target", "-Xswiftc", "x86_64-apple-macosx10.12"
    bin.install ".build/release/bootoption"
  end
end
