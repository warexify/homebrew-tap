cask "qtiasl" do
  version "1.0.64"
  sha256 "165525d3d438eb582505bc7d061b106bf49fa5bf7c2bf5f76532c314f7bc0460"

  url "https://github.com/ic005k/QtiASL/releases/download/#{version}/QtiASL_Mac.dmg"
  name "QtiASL"
  homepage "https://github.com/ic005k/QtiASL"

  depends_on macos: ">= :high_sierra"

  app "QtiASL.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
