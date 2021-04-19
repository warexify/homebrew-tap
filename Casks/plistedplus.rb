cask "plistedplus" do
  version "1.0.50"
  sha256 "386a62a17e7e7fb717b11eafb866e4d3a7c4f59968c093a09e8651e1505100f4"
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
