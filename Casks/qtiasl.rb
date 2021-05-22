cask "qtiasl" do
  version "1.0.61"
  sha256 "2fdc21511cd6e9ca87093554f537e71ec8d87021349c6f948a9db98b248292d4"
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
