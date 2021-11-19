cask "uefitool" do
  version "0.28.0"
  sha256 "3af06adac472b8471b90ba66b3588ce79ee9c2a496b4cb4ce2bd6efc1d175f60"

  url "https://github.com/LongSoft/UEFITool/releases/download/#{version}/UEFITool_0.28.0_mac.zip"
  name "UEFITool"
  homepage "https://github.com/LongSoft/UEFITool"

  depends_on macos: ">= :high_sierra"

  app "UEFITool.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
