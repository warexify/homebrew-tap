class Bootoption < Formula
  desc "EFI boot menu manipulation for macOS, like efibootmgr"
  homepage "https://github.com/vulgo/bootoption/"
  url "https://github.com/vulgo/bootoption/archive/v0.2.99.tar.gz"
  sha256 "d9dd8f5e063504e076f03fa0b455b26c730bd8f7633ca30ec2beb06734e4bb71"
  head "https://github.com/vulgo/bootoption.git"

  bottle :unneeded

  depends_on :xcode => ["9.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", "-Xswiftc", "-target", "-Xswiftc", "x86_64-apple-macosx10.12"
    bin.install ".build/release/bootoption"
    man.install Dir["man/*"]
  end

  test do
    system "#{bin}/bootoption", "--version"
  end
end
