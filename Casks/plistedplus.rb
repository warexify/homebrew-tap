cask "plistedplus" do
  version "1.0.70"
  sha256 "5a8490474ab931b1ec21d58905fde3ac1ddf394614c8965202285351c20c628e"

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
