cask "plistedplus" do
  version "1.0.54"
  sha256 "7cca28a500321942e4dddc9e89c5c496787cfe912175356a06c1ca14bcb29f1b"
  url "https://github.com/ic005k/PlistEDPlus/releases/download/#{version}/PlistEDPlus_Mac.dmg"
  name "PlistEDPlus"
  homepage "https://github.com/ic005k/PlistEDPlus"

  depends_on macos: ">= :catalina"

  app "PlistEDPlus.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
