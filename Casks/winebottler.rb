cask "winebottler" do
  version "1.8.6"
  sha256 "09438c5a9b9c42fffee19866ec67362a67fbf7e1784946f42465f76fefb0efa4"

  url "https://winebottler.kronenberg.org/combo/builds/WineBottlerCombo_#{version}.dmg"
  name "WineBottler"
  homepage "https://winebottler.kronenberg.org/"

  app "WineBottler.app"
  app "Wine.app"

  zap trash: [
    "~/Library/Application Support/Wine",
    "~/Library/Application Support/WineBottler",
    "~/Library/Preferences/org.kronenberg.Wine.plist",
    "~/Library/Preferences/org.kronenberg.WineBottler.plist",
    "~/Library/Preferences/org.kronenberg.Winetricks.plist",
    "~/Library/Caches/org.kronenberg.Wine",
    "~/Library/Caches/org.kronenberg.WineBottler",
    "~/Library/Caches/org.kronenberg.Winetricks",
  ]
end
