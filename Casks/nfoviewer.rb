cask 'nfoviewer' do
  version '0.3 beta 3'
  sha256 'f0f3bc2879bd9952c85c538cb9b85aee90bd66c91464269dd820053129b60a3b'

  url 'http://blockart.sourceforge.net/NFOViewer%20(0.3%20beta%203).zip'
  name 'NFOViewer'
  homepage 'http://blockart.sourceforge.net/'

  app 'NFOViewer.app'
  font 'ProFont/ProFontWindows.ttf'

  zap trash: [
               '~/Library/Caches/net.sourceforge.blockart',
               '~/Library/Preferences/net.sourceforge.blockart.plist',
             ]
end
