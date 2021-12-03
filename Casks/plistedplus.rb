cask "plistedplus" do
  version "1.0.89"
  sha256 "a045ef009c56c7def1d373788578ee9a809493af8dc8cf5592c6bfc62633f815"

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
