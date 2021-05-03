cask "qtopencoreconfig" do
  version "20210506"
  sha256 "f6726ea867fb664289407dc66a1f433e6d4e45fee0959d03269f60e17c0d2d32"
  url "https://github.com/ic005k/QtOpenCoreConfig/releases/download/#{version}/OCAT_Mac.dmg"
  name "QtOpenCoreConfig"
  homepage "https://github.com/ic005k/QtOpenCoreConfig"

  depends_on macos: ">= :catalina"

  app "OCAuxiliaryTools.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
