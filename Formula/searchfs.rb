class Searchfs < Formula
  desc "Quickly search by filename on entire HFS+ and APFS volumes"
  homepage "https://sveinbjorn.org/searchfs"
  url "https://sveinbjorn.org/files/software/searchfs.zip"
  head "https://github.com/sveinbjornt/searchfs.git"
  sha256 "b80126e1ccb87e537307635f369d9ab7ac01a31a67cb1a6a13e6b1db042d9499"
  version "0.3"

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
