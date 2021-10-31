class Searchfs < Formula
  desc "Quickly search by filename on entire HFS+ and APFS volumes"
  homepage "https://sveinbjorn.org/searchfs"
  url "https://sveinbjorn.org/files/software/searchfs.zip"
  version "0.3"
  sha256 "b80126e1ccb87e537307635f369d9ab7ac01a31a67cb1a6a13e6b1db042d9499"
  head "https://github.com/sveinbjornt/searchfs.git"

  def install
    bin.install "searchfs" if build.stable?

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
