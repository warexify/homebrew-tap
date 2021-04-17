cask "plistedplus" do
  version "1.0.49"
  sha256 "576a78c4c41bc3ec0e16d48bb77e214fdd65d9f8f457d5e53cbc847bde0767f1"
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
