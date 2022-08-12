class Directhw < Formula
  desc "Linux compatibility library to run utilities on Windows and OS X"
  homepage "https://www.coreboot.org/DirectHW"
  url "https://github.com/warexify/directhw/archive/v1.4.tar.gz"
  sha256 "7b439bea9f0abbd425715588007c90851c229d9c72fc5a6aa8eee70042be721c"
  head "https://github.com/warexify/directhw.git"

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
