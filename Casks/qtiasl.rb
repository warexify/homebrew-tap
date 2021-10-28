cask "qtiasl" do
  version "1.0.69"
  sha256 "f936186d2e564646a9c973f08cc982b278ccb47873ec7b07c983d4c1239ca92c"

  url "https://github.com/ic005k/QtiASL/releases/download/#{version}/QtiASL_Mac.dmg"
  name "QtiASL"
  homepage "https://github.com/ic005k/QtiASL"

  depends_on macos: ">= :high_sierra"

  app "QtiASL.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
