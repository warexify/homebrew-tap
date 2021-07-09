cask "plistedplus" do
  version "1.0.60"
  sha256 "304c1b60977db50410d43a2c6b611a7b8bf34aa0eec1c3bea1b90dd4db3323c3"

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
