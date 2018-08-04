cask 'wxformbuilder' do
  version '3.8.0'
  sha256 'fa252cf657e8168c4dcf2bcb36c0fd254334cc79a7b9b537cbb1e0e4b675ca03'

  url 'https://github.com/wxFormBuilder/wxFormBuilder/releases/download/v3.8.0/wxFormBuilder_macOS.zip'
  name 'wxCrafter'
  homepage 'http://wxformbuilder.org'

  app 'wxFormBuilder.app'

  zap trash: [
               '~/Library/Preferences/wxFormBuilder Preferences',
               '~/Library/Preferences/wxformbuilder.plist'
             ]
end
