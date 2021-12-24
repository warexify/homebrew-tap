cask "qtiasl" do
  version "1.0.88"
  sha256 "ad53ebd2e035a3d71f4a93059f606b58cd936207a31a830e0644f1df234d5ab2"

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
