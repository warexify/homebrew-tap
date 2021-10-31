class Otfcc < Formula
  desc "Parses & writes SFNT structures"
  homepage "https://github.com/caryll/otfcc/releases/"
  url "https://github.com/caryll/otfcc/archive/v0.10.4.tar.gz"
  sha256 "d9c74825ddac700eb429de31de7cb0a249636f47c6a4cc64eaa102a40966cf00"

  def install
    system "./dep/bin-osx/premake5", "xcode4"
    xcodebuild "-workspace", "build/xcode/otfcc.xcworkspace", "-scheme", "otfccbuild", "-configuration", "Release",
"SYMROOT=build"
    xcodebuild "-workspace", "build/xcode/otfcc.xcworkspace", "-scheme", "otfccdump", "-configuration", "Release",
"SYMROOT=build"
    bin.install "bin/release-x64/otfccbuild"
    bin.install "bin/release-x64/otfccdump"
  end
end
