cask "uefitool-ne" do
  version "A59"
  sha256 "5a3f41c09c2d8a9ba153f2ec7fc60db947f532acf5a107a274b096646758b75d"

  url "https://github.com/LongSoft/UEFITool/releases/download/#{version}/UEFITool_NE_A59_mac.zip"
  name "UEFITool_NE"
  homepage "https://github.com/LongSoft/UEFITool"

  depends_on macos: ">= :high_sierra"

  app "UEFITool.app", target: "UEFITool_NE.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
