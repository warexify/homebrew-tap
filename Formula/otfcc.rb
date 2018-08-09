class Otfcc < Formula
  desc "Parses & writes SFNT structures."
  homepage "https://github.com/caryll/otfcc/releases/"
  url "https://github.com/caryll/otfcc/archive/v0.9.6.tar.gz"
  sha256 "01e1bb2d82e221488517dfec4fdd3fa342c4c6b6de6e654bec3fd78f77079542"

  devel do
    url "https://github.com/caryll/otfcc/archive/v0.10.3-alpha.tar.gz"
    sha256 "81f8b9b8108c415a645e7e8a407a028531346e61fb570fec541f4aaa4703b1e3"
  end

  bottle :unneeded

  def install
    system "./dep/bin-osx/premake5", "xcode4"
    system "xcodebuild",
              "-workspace", "build/xcode/otfcc.xcworkspace",
              "-scheme", "otfccbuild",
              "-configuration", "Release"
    system "xcodebuild",
              "-workspace", "build/xcode/otfcc.xcworkspace",
              "-scheme", "otfccdump",
              "-configuration", "Release"

    bin.install "bin/release-x64/otfccbuild"
    bin.install "bin/release-x64/otfccdump"
  end
end
