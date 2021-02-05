class Keyboardswitcher < Formula
  desc "List, show and switch OSX Keyboard Layouts from the command-line"
  homepage "https://github.com/Lutzifer/keyboardSwitcher"
  url "https://github.com/Lutzifer/keyboardSwitcher/archive/1.0.1.tar.gz"
  sha256 "3c925eda22be982ebe2d619cccb1c6ce3bdef715725b7cdee312c769d1cb6f9c"
  head "https://github.com/Lutzifer/keyboardSwitcher.git"

  bottle :unneeded

  depends_on xcode: :build

  def install
    xcodebuild "-configuration", "Release", "SYMROOT=build", "PREFIX=#{prefix}"
    bin.install("build/Release/keyboardSwitcher")
  end

  test do
    system "#{bin}/keyboardSwitcher"
  end
end
