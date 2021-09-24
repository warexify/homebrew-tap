cask "qtopencoreconfig" do
  version "20210925"
  sha256 "a96f2917d8d3a2a00ee5cf6cb8b2fa4c3d56a4a682e6fb03535ca1102030beb4"

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
