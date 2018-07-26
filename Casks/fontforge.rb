cask 'fontforge' do
  version '2018-07-08-e688b8c'
  sha256 '6c069751d09fcf55c75c2523bcf9a8945a3bacf390a553b032985a56cb19f397'

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
