class Ionice < Formula
  desc "For macOS"
  homepage "https://www.kernel.org/pub/linux/utils/util-linux"
  url "https://github.com/someposer/ionice/archive/v0.1.tar.gz"
  sha256 "4fe17adb0346e088ead6630c7eb2d7cb815833b207306323af9f52aae1151a12"
  head "https://github.com/someposer/ionice.git"

  bottle :unneeded

  def install
    system "make", "ionice"
    system "make", "ionice_fork"
    bin.mkpath
    bin.install "ionice"
    bin.install "ionice_fork"
  end

  test do
    system "#{bin}/ionice", "-c3", "ls"
  end
end
