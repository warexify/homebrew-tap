cask "uefireplace" do
  version "0.28.0"
  sha256 "b9799237c2529d245ac98d80d70912b39ed16b23b40a5c2a8bd53dddaa4fe28a"

  url "https://github.com/LongSoft/UEFITool/releases/download/#{version}/UEFIReplace_0.28.0_mac.zip"
  name "UEFIReplace"
  homepage "https://github.com/LongSoft/UEFITool"

  depends_on macos: ">= :high_sierra"

  binary "UEFIReplace"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
