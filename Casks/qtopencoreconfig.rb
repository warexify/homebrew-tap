cask "qtopencoreconfig" do
  version "20210917"
  sha256 "473e09ee949b048089fc2a765c6c181ac11f7212a6c14953e75f44fd7676c40c"

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
