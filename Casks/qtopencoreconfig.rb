cask "qtopencoreconfig" do
  version "20211011"
  sha256 "0d350b2c91b31374150633600739339ffb3b7cdeb990fd6f5047ef718af3b2e3"

  url "https://github.com/ic005k/QtOpenCoreConfig/releases/download/#{version}/OCAT_Mac.dmg"
  name "QtOpenCoreConfig"
  homepage "https://github.com/ic005k/QtOpenCoreConfig"

  depends_on macos: ">= :high_sierra"

  app "OCAuxiliaryTools.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
