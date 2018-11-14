class AfdkoLegacy < Formula
  desc "Adobe Font Development Kit for OpenType"
  homepage "https://www.adobe.com/devnet/opentype/afdko.html"
  url "http://download.macromedia.com/pub/developer/opentype/FDK.2.5.65322/FDK-25-MAC.b65322.zip"
  version "2.5.65322"
  sha256 "1639972e94e44631f14a57760a15422d02d79d5b7c97c1f17eaeb0f5439b0363"

  devel do
    url "http://download.macromedia.com/pub/developer/opentype/FDK.2.5.65781/FDK.2.5.65781-MAC.zip"
    version "2.5.65781"
    sha256 "1d4b00567fbc10376a43419a6f7e296997bb955ab6a7c96c58942c908f69b550"
  end

  bottle :unneeded

  def install
    if build.stable?
      prefix.install Dir["FDK-25-MAC.b65322/*"]
      inreplace "#{prefix}/Tools/osx/setFDKPaths", 'AFDKO_EXE_PATH="${cmdDirPath}"', "AFDKO_EXE_PATH=#{prefix}/Tools/osx"
      inreplace "#{prefix}/Tools/osx/setFDKPaths", 'AFDKO_Python="${cmdDirPath}"/Python/Current/bin/python', "AFDKO_Python=#{prefix}/Tools/osx/Python/Current/bin/python"
      inreplace "#{prefix}/Tools/osx/setFDKPaths", 'AFDKO_Scripts="${AFDKO_EXE_PATH}"/../SharedData/FDKScripts', "AFDKO_Scripts=#{prefix}/Tools/SharedData/FDKScripts"
      bin.install_symlink %w[
        AFDKOPython IS autohint autohintexe charplot checkOutlines checkOutlinesUFO checkoutlinesexe
        compareFamily copyCFFCharstrings detype1 digiplot fontplot fontplot2 fontsetplot hintplot kernCheck
        makeInstances makeInstancesUFO makeotf makeotfexe mergeFonts otc2otf otf2otc rotateFont setFDKPaths
        sfntdiff sfntedit spot stemHist ttx ttxn tx type1 ufonormalizer waterfallplot
      ].map { |s| prefix/"Tools/osx/" + s }
    end
    if build.devel?
      prefix.install Dir["FDK/*"]
      inreplace "#{prefix}/Tools/osx/setFDKPaths", 'AFDKO_EXE_PATH="${cmdDirPath}"', "AFDKO_EXE_PATH=#{prefix}/Tools/osx"
      inreplace "#{prefix}/Tools/osx/setFDKPaths", 'AFDKO_Python="${cmdDirPath}"/Python/Current/bin/python', "AFDKO_Python=#{prefix}/Tools/osx/Python/Current/bin/python"
      inreplace "#{prefix}/Tools/osx/setFDKPaths", 'AFDKO_Scripts="${AFDKO_EXE_PATH}"/../SharedData/FDKScripts', "AFDKO_Scripts=#{prefix}/Tools/SharedData/FDKScripts"
      bin.install_symlink %w[
        AFDKOPython IS autohint autohintexe buildCFF2VF buildMasterOTFs charplot checkOutlines
        checkOutlinesUFO checkoutlinesexe compareFamily copyCFFCharstrings detype1 digiplot fontplot fontplot2
        fontsetplot hintplot kernCheck makeInstances makeInstancesUFO makeotf makeotfexe mergeFonts otc2otf otf2otc
        rotateFont setFDKPaths sfntdiff sfntedit spot stemHist ttx ttxn tx type1 ufonormalizer waterfallplot
      ].map { |s| prefix/"Tools/osx/" + s }
    end
  end

  test do
    system "#{bin}/makeotf", "-h"
  end
end
