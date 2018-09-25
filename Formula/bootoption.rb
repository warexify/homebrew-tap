class Bootoption < Formula
  desc "Command line utility for managing a firmware's boot menu"
  homepage "https://github.com/vulgo/bootoption/"
  url "https://github.com/vulgo/bootoption/archive/v0.2.7.tar.gz"
  sha256 "9126e2556477650bb13f5bfcea84536a35029356244d58db47b5aefdf3f223d8"
  head "https://github.com/vulgo/bootoption.git"

  bottle :unneeded

  depends_on :xcode => ["9.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "-Xswiftc", "-target", "-Xswiftc", "x86_64-apple-macosx10.12"
    bin.install ".build/release/bootoption"
  end
end
