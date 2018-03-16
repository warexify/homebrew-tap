class Ionice < Formula
  desc "ionice for macOS"
  homepage "https://github.com/warexify/ionice"
  url "https://github.com/warexify/ionice/archive/v0.1.tar.gz"
  version "0.1"
  sha256 "4fe17adb0346e088ead6630c7eb2d7cb815833b207306323af9f52aae1151a12"

  head "https://github.com/warexify/ionice.git"

  def install
    system "make"
    system "mkdir #{prefix}/bin"
    system "cp ionice #{prefix}/bin"
  end

  test do
    system "#{bin}/ionice", "-c3", "ls"
  end
end