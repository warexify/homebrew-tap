cask "ocauxiliarytools" do
  version "20220208"
  sha256 "a36830f02890b3be441f1292b48acc277b71953112a2b61331d0d1186a1458bd"

  url "https://github.com/ic005k/OCAuxiliaryTools/releases/download/#{version}/OCAT_Mac.dmg"
  name "OCAuxiliaryTools"
  homepage "https://github.com/ic005k/OCAuxiliaryTools"

  depends_on macos: ">= :high_sierra"

  app "OCAuxiliaryTools.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
