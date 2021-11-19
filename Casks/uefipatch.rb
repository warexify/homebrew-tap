cask "uefipatch" do
  version "0.28.0"
  sha256 "7647dddd3ec86b8ca31b1cc574c69508a583241d7a843d96177181f601dfbe7b"

  url "https://github.com/LongSoft/UEFITool/releases/download/#{version}/UEFIPatch_0.28.0_mac.zip"
  name "UEFIPatch"
  homepage "https://github.com/LongSoft/UEFITool"

  depends_on macos: ">= :high_sierra"

  binary "UEFIPatch"
  artifact "patches.txt", target: "/usr/local/bin/patches.txt"
  artifact "patches-misc.txt", target: "/usr/local/bin/patches-misc.txt"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
