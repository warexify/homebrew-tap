cask 'winebottler-beta' do
  version '2.0.0'
  sha256 '725955d89b36e8ef36abf4a56db45e15de16a827ddecc7edc88e88ff440c3390'

  url "https://winebottler.kronenberg.org/combo/builds/WineBottlerCombo_#{version}.dmg"
  name 'WineBottler'
  homepage 'https://winebottler.kronenberg.org'

  app 'WineBottler.app'
  app 'Wine.app'

  zap trash: [
               '~/Library/Application Support/Wine',
               '~/Library/Application Support/WineBottler',
               '~/Library/Preferences/org.kronenberg.Wine.plist',
               '~/Library/Preferences/org.kronenberg.WineBottler.plist',
               '~/Library/Preferences/org.kronenberg.Winetricks.plist',
               '~/Library/Caches/org.kronenberg.Wine',
               '~/Library/Caches/org.kronenberg.WineBottler',
               '~/Library/Caches/org.kronenberg.Winetricks',
             ]
end
