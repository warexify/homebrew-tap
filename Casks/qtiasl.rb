cask "qtiasl" do
  version "1.0.59"
  sha256 "295c06e8d6fda7c03f7f6b42243fc6a859517035f8cad1ed3026b50177f8719d"
  url "https://github.com/ic005k/QtiASL/releases/download/#{version}/QtiASL_Mac.dmg"
  name "QtiASL"
  homepage "https://github.com/ic005k/QtiASL"

  depends_on macos: ">= :catalina"

  app "QtiASL.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
