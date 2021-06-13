cask "qtiasl" do
  version "1.0.63"
  sha256 "58fb7978f4719a201bceeee757b46fdeb857eca2664b15e90201591c4c9a0e8d"

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
