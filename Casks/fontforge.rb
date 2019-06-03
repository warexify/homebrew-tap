cask 'fontforge' do
  version '2019-06-03-9fb69fc'
  sha256 '5b95bdf88a836859be8fdd85ad423569fa6948ae004f0c889d6a7af395ec8e3b'

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
