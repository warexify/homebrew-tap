cask "qtopencoreconfig" do
  version "20210421"
  sha256 "59d72dee7fbd3d34a16b954f622974f09516a27f95024c24b01a2fcc28a90847"
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
