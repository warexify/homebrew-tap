cask "qtiasl" do
  version "1.0.74"
  sha256 "12485d2bc4a83988f10e5b066257e6d911dd309b9fc5083e6810fa6b8752fe26"

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
