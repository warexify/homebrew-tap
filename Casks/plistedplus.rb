cask "plistedplus" do
  version "1.0.56"
  sha256 "b05b09641d8cc0874c83a0eec39c37981cd8ac8f2cf791e2f8860c7d85846a06"
  url "https://github.com/ic005k/PlistEDPlus/releases/download/#{version}/PlistEDPlus_Mac.dmg"
  name "PlistEDPlus"
  homepage "https://github.com/ic005k/PlistEDPlus"

  depends_on macos: ">= :high_sierra"

  app "PlistEDPlus.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
