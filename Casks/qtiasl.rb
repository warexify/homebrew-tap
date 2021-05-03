cask "qtiasl" do
  version "1.0.58"
  sha256 "3c9ba3681c4f8d7ab0f4e037d51802e0d263e0e31a642681b7cc8d8da945ac2b"
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
