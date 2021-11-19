cask "ifrextract" do
  version "0.3.7"
  sha256 "f182844333bbe997c997c0869e139d3864775d6c9fa23f8295717679860575f7"

  url "https://github.com/LongSoft/Universal-IFR-Extractor/releases/download/#{version}/ifrextract_v#{version}.mac.zip"
  name "ifrextract"
  homepage "https://github.com/LongSoft/Universal-IFR-Extractor"

  depends_on macos: ">= :high_sierra"

  binary "ifrextract"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
