cask "qtiasl" do
  version "1.0.62"
  sha256 "c4d6ebe06aa78856a33ab2be63c9c2b1f95efeed08c4151b03c08c443d7b122d"
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
