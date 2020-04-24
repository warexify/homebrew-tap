class Bootoption < Formula
  desc "EFI boot menu manipulation for macOS"
  homepage "https://github.com/bootoption/bootoption/"
  url "https://github.com/bootoption/bootoption/archive/0.4.0.tar.gz"
  sha256 "284f5411529bee580f5bfdf28e91db565b7fff8f78ded06061b5d321853fab3a"
  head "https://github.com/bootoption/bootoption.git"

  bottle :unneeded

  depends_on :xcode => ["9.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc", "-static-stdlib"
    bin.install ".build/release/bootoption"
    man.install Dir["man/*"]
  end

  test do
    system "#{bin}/bootoption", "--version"
  end
end