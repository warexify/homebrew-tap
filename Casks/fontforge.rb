cask 'fontforge' do
  version '2020-09-09-c3468cb'
  sha256 '372793ec8716cc742dfe1f11766507769702099c4aaa33e8bc0f102913095715'

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
