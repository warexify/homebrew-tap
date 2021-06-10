cask "qtopencoreconfig" do
  version "20210610"
  sha256 "2d57c6eeef6cfd5da60c36a5b9a5eeeb27ba78fd6c3fa9a3c408919855ae6d02"

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
