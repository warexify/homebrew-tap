class Keyboardswitcher < Formula
  desc "List, show and switch OSX Keyboard Layouts from the command-line"
  homepage "https://github.com/Lutzifer/keyboardSwitcher"
  url "https://github.com/Lutzifer/keyboardSwitcher/archive/1.0.2.tar.gz"
  sha256 "25ebbe0a2c57fad9ce37b1dfbde2f9b612b3f72af87002ddb17903b396adb1d9"
  head "https://github.com/Lutzifer/keyboardSwitcher.git"

  depends_on xcode: :build

  def install
    xcodebuild "-configuration", "Release", "SYMROOT=build", "PREFIX=#{prefix}"
    bin.install("build/Release/keyboardSwitcher")
  end

  test do
    system "#{bin}/keyboardSwitcher"
  end
end
