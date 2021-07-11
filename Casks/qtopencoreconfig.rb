cask "qtopencoreconfig" do
  version "20210711"
  sha256 "4cfd1071f0e6b4f4efe47d07a40f4558acbb7f1bdcbfb8eeaeb241ec684f0d4b"

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
