cask 'wxformbuilder' do
  version '3.9.0'
  sha256 '259f429601d2fd96e174d162171795cd8ae07d56799618f8c844fbe65306b8eb'

  # github.com was verified as official when first introduced to the cask
  url "https://github.com/wxFormBuilder/wxFormBuilder/releases/download/v#{version}/wxFormBuilder_macOS.zip"
  name 'wxFormBuilder'
  homepage 'http://wxformbuilder.org/'

  app 'wxFormBuilder.app'

  zap trash: [
               '~/Library/Preferences/wxFormBuilder Preferences',
               '~/Library/Preferences/wxformbuilder.plist',
             ]
end
