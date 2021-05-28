cask "xerox-wc3025" do
  version "1.06"
  sha256 "53ca8a481381367f5bd619b079641093803a82d29d137d0e94cd1ef354f73950"

  url "https://download.support.xerox.com/pub/drivers/WC3025/drivers/macOS10_15/ar/Xerox_WorkCentre_3025_Driver_1.06.00.dmg"
  name "Xerox WC3025"
  homepage "https://www.support.xerox.com/support/workcentre-3025/downloads/enus.html?operatingSystem=macOSx11"

  depends_on macos: ">= :catalina"

  pkg "MAC_Printer/Printer Driver.pkg"

  uninstall pkgutil: [
    "com.xerox.PrinterDriverInstaller.pkg",
  ]
end
