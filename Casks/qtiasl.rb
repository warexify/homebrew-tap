cask "qtiasl" do
  version "1.0.70"
  sha256 "1dc676511a11e6f9c9f956f9645aee364a38c79b56c12d82aecf8b668826c265"

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
