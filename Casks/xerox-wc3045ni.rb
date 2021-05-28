cask "xerox-wc3045ni" do
  version "1.012"
  sha256 "74f8b78e6b3c936485533468888faf0b218133bd128b273a528cc757b6e3eb11"

  url "https://download.support.xerox.com/pub/drivers/WC3045/drivers/macos1012/ar/xrwc3045ni1012m107ml.dmg"
  name "Xerox WC3045NI"
  homepage "https://www.support.xerox.com/support/workcentre-3045/downloads/enus.html?operatingSystem=macOS10_15"

  depends_on macos: ">= :sierra"

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
