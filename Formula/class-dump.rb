class ClassDump < Formula
  desc "(Fork) Utility for examining the Objective-C segment of Mach-O files"
  homepage "http://stevenygard.com/projects/class-dump/"
  url "https://github.com/warexify/class-dump/archive/3.7.tar.gz"
  sha256 "c328bd80e8ed051a518e8c2bac6cc95a3a7368d89f988e4fc243d6c7f3ae8702"
  head "https://github.com/warexify/class-dump.git"

  bottle :unneeded

  depends_on xcode: :build

  def install
    xcodebuild "-configuration", "Release", "SYMROOT=build", "PREFIX=#{prefix}"
    bin.install "build/Release/class-dump"
    bin.install "build/Release/deprotect"
    bin.install "build/Release/formatType"
    lib.install "build/Release/libMachObjC.a"
  end

  test do
    system "#{bin}/class-dump"
  end
end
