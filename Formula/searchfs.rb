class Searchfs < Formula
  desc "Quickly search by filename on entire HFS+ and APFS volumes"
  homepage "https://sveinbjorn.org/searchfs"
  url "https://sveinbjorn.org/files/software/searchfs.zip"
  head "https://github.com/sveinbjornt/searchfs.git"
  sha256 "a4bf7303bebed9ff6f7f440d3b23022d39e72521e59ec2400ac6631512f3b394"
  version "0.1"

  bottle :unneeded

  def install
    if build.stable?
      bin.install "searchfs"
    end

    if build.head?
      system "make"
      bin.install "searchfs"
      man.mkpath
      man1.install "searchfs.1"
    end
  end

  test do
    system "#{bin}/searchfs", "--help"
  end
end
