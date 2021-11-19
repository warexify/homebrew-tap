cask "uefiextract" do
  version "A59"
  sha256 "1dded39aef501d45f0190a1517c7677855ee1bf1190c85c967ea44f1dcfd969b"

  url "https://github.com/LongSoft/UEFITool/releases/download/#{version}/UEFIExtract_NE_A59_mac.zip"
  name "UEFIExtract"
  homepage "https://github.com/LongSoft/UEFITool"

  depends_on macos: ">= :high_sierra"

  binary "UEFIExtract"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
