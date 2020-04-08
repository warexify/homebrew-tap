cask 'fontforge' do
  version '2020-04-05-1604c74'
  sha256 '4389f7253793ba77f8d17c3d8b1bf506363627d0fadad42abb9e9f7e5fc1c12c'

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
