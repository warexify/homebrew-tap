cask "plistedplus" do
  version "1.0.62"
  sha256 "cb6767fd8da2f157461696cee20c934a06ff5d5563d821ee9b80cec96d6574ca"

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
