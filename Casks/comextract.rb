cask "comextract" do
  version "0.1"
  sha256 "bbc22d4fdbb49f44eefa5a2c0fd3762df19f03a2d70f17218b1fb57b2f681df3"

  url "https://github.com/LongSoft/ToshibaComExtractor/releases/download/v#{version}/comextract-mac64.zip"
  name "comextract"
  homepage "https://github.com/LongSoft/ToshibaComExtractor"

  depends_on macos: ">= :high_sierra"

  binary "comextract"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
