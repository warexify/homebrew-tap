cask "qtopencoreconfig" do
  version "20210528"
  sha256 "db050cac452c197645aa4b5f4e8a3f63ca9d0b08f6398c8517e44dd028755287"
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
