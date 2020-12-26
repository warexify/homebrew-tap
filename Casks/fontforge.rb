cask 'fontforge' do
  version '2020-11-07-21ad4a1'
  sha256 '64e7193485b2047ff497ec43a39793e18593b2702a0724810f8c2c8ca8a34999'

  # dl.bintray.com was verified as official when first introduced to the cask
  url "https://github.com/fontforge/fontforge/releases/download/20201107/FontForge-#{version}.app.dmg"
  name 'FontForge'
  homepage 'https://fontforge.github.io/en-US/'

  depends_on macos: '>= :yosemite'

  app 'FontForge.app'

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
