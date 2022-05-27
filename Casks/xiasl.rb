cask "xiasl" do
  version "1.1.65"
  sha256 "f42c7024ecd8dab4d815ea6b30f86e8f6b2017039264078fda2dfd14ebcfcacb"

  url "https://github.com/ic005k/Xiasl/releases/download/#{version}/Xiasl_Mac.dmg"
  name "Xiasl"
  homepage "https://github.com/ic005k/Xiasl"

  depends_on macos: ">= :high_sierra"

  app "Xiasl.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
