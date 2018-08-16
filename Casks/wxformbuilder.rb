cask 'wxformbuilder' do
  version '3.8.1'
  sha256 '23c761b42c73a20443e1c0e87a07d114cacbc11f81ab70385b053384aa7512cb'

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
