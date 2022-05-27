cask "xplist" do
  version "1.2.47"
  sha256 "0db66080fcbd447cbb14e585d237b327b7c57f4504c7283ef05a2359ecd351c3"

  url "https://github.com/ic005k/Xplist/releases/download/#{version}/Xplist_Mac.dmg"
  name "Xplist"
  homepage "https://github.com/ic005k/Xplist"

  depends_on macos: ">= :high_sierra"

  app "Xplist.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
