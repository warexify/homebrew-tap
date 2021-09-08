cask "qtopencoreconfig" do
  version "20210907"
  sha256 "815e666f2cca2d0aed311b480ddcb934e9c726b921c035abc42d11397b7003e3"

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
