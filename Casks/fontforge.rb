cask 'fontforge' do
  version '2018-10-06-9e9278c'
  sha256 '011580bbf5b830fa8a5832d761244419ca3a249b27b92da4ea03bc6974001a8e'

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
