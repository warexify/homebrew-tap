class Bootoption < Formula
  desc "Command line utility for managing a firmware's boot menu"
  homepage "https://github.com/vulgo/bootoption/"
  url "https://github.com/vulgo/bootoption/archive/v0.2.5.tar.gz"
  sha256 "f3247a1f7d52fa9bcc5b0ed8c46deedb9e53b384540e1694ba21a9378550c149"
  head "https://github.com/vulgo/bootoption.git"

  bottle :unneeded

  depends_on :xcode => ["9.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/bootoption"
  end
end
