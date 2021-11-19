cask "uefifind" do
  version "A59"
  sha256 "cb584158a7464fc6d6d91cd19dafde83f73b2bf396ebf548774a67f73955d572"

  url "https://github.com/LongSoft/UEFITool/releases/download/#{version}/UEFIFind_NE_A59_mac.zip"
  name "UEFIFind"
  homepage "https://github.com/LongSoft/UEFITool"

  depends_on macos: ">= :high_sierra"

  binary "UEFIFind"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
