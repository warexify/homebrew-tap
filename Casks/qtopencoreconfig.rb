cask "qtopencoreconfig" do
  version "20210526"
  sha256 "6eac32cfec4c14b9b7a3681db42a2b40619dd9cac3ebceb9c65f141666ef45d3"
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
