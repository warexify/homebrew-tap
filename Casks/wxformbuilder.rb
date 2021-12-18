cask "wxformbuilder" do
  version "3.10.1"
  sha256 "399755f3a06d76a8e128cff4f39780162de774f2ab235e0a71d4385def1566e6"

  # github.com was verified as official when first introduced to the cask
  url "https://github.com/wxFormBuilder/wxFormBuilder/releases/download/v#{version}/wxFormBuilder-#{version}-macos-11.6-x86_64-bundle.zip",
      verified: "github.com/wxFormBuilder/wxFormBuilder/"
  name "wxFormBuilder"
  homepage "http://wxformbuilder.org/"

  app "wxFormBuilder.app"

  zap trash: [
    "~/Library/Preferences/wxFormBuilder Preferences",
    "~/Library/Preferences/wxformbuilder.plist",
  ]
end
