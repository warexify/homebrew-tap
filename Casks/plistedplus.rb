cask "plistedplus" do
  version "1.0.52"
  sha256 "0e82c6f66674a7f92ad1a282e9919a6a477c094cc21389d350e8acdaf9c89200"
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
