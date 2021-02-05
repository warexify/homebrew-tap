class Bootoption < Formula
  desc "EFI boot menu manipulation for macOS"
  homepage "https://github.com/bootoption/bootoption/"
  url "https://github.com/bootoption/bootoption/archive/0.6.0.tar.gz"
  sha256 "c635749ca34756c142034bfd4ffd50f541a0f2198f3058c24fcef7372affbd92"
  head "https://github.com/bootoption/bootoption.git"

  bottle :unneeded

  depends_on xcode: ["9.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/bootoption"
    man.install Dir["man/*"]
  end

  test do
    system "#{bin}/bootoption", "--version"
  end
end
