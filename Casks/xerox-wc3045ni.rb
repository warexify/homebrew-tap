cask "xerox-wc3045ni" do
  version "1.010"
  sha256 "e31a87296563982977084e8c07b184fbbfe8b999f4c6f7fc50c52a371a220959"

  url "http://download.support.xerox.com/pub/drivers/WC3045/drivers/macos1012/ar/xrwc3045ni1010m107ml.dmg"
  name "Xerox WC3045NI"
  homepage "http://www.support.xerox.com/support/workcentre-3045/downloads/enus.html?operatingSystem=macOS10_13"

  pkg "Xerox WorkCentre 3045NI installer.pkg"

  uninstall pkgutil: [
    "com.Xerox.xeroxWorkcentre3045Ni.105LaunchAgents3045NI.pkg",
    "com.Xerox.xeroxWorkcentre3045Ni.1010filter3045NI.pkg",
    "com.Xerox.xeroxWorkcentre3045Ni.Printers3045NI.pkg",
    "com.Xerox.xeroxWorkcentre3045Ni.ICA3045NI.pkg",
    "com.Xerox.xeroxWorkcentre3045Ni.1010PDEs3045NI.pkg",
    "com.Xerox.xeroxWorkcentre3045Ni.106TWAIN3045NI.pkg",
    "com.Xerox.xeroxWorkcentre3045Ni.1010PPDs3045NI.pkg",
    "com.Xerox.xeroxWorkcentre3045Ni.postflight.pkg",
    "com.Xerox.xeroxWorkcentre3045Ni.Applicationsfor3045NI.pkg",
  ]
end
