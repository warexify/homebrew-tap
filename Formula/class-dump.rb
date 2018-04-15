class ClassDump < Formula
  desc "(Fork) Utility for examining the Objective-C segment of Mach-O files"
  homepage "http://stevenygard.com/projects/class-dump/"
  url "https://github.com/warexify/class-dump/archive/3.6.tar.gz"
  sha256 "fe0629982344aac51c0eea1e0cff4e908a5cc2afa94b4f4eacbd12b5feec5392"

  depends_on :xcode => :build

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
