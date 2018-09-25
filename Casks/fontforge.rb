cask 'fontforge' do
  version '2018-09-17-5d09182'
  sha256 '7c05ed9a4d927e30a2638e762581f87d21b6f1bf7d5099687f1032dfcc09f56b'

  # dl.bintray.com was verified as official when first introduced to the cask
  url "https://dl.bintray.com/fontforge/fontforge/:FontForge-#{version}.app.dmg"
  name 'FontForge'
  homepage 'https://fontforge.github.io/en-US/'

  depends_on x11: true
  depends_on macos: '>= :yosemite'

  app 'FontForge.app'

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
