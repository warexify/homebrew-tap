class Directhw < Formula
  desc "Linux compatibility library to run utilities on Windows and OS X"
  homepage "https://www.coreboot.org/DirectHW"
  url "https://github.com/warexify/directhw/archive/v1.4.tar.gz"
  sha256 "5840f082d098b9cf8d870bed12ad7687ed7b59253e762aa878cc541f7d985397"
  head "https://github.com/warexify/directhw.git"

  bottle :unneeded

  depends_on xcode: :build

  def install
    system "make", "main"
    system "make", "libs"
    share.install "build/Release/DirectHW.kext"
    frameworks.install "build/Release/DirectHW.framework"
    lib.install "build/Release/libDirectHW.a"
    lib.install "build/Release/libDirectHW.dylib"
  end

  test do
    system "false"
  end
end
