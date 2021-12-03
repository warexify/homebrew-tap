cask "qtopencoreconfig" do
  version "20220003"
  sha256 "48c0835f797150957f6979e923580a6d681edb2ef73259444272db5b4054e1ce"

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
