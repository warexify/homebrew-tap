cask "qtiasl" do
  version "1.0.60"
  sha256 "f069863f012772040314da323cdcb8f1dee90d274a3d7c2ae61876558c40817a"
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
