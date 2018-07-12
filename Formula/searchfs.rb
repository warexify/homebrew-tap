class Searchfs < Formula
  desc "Quickly search by filename on entire HFS+ and APFS volumes"
  homepage "https://sveinbjorn.org/searchfs"
  url "https://sveinbjorn.org/files/software/searchfs.zip"
  head "https://github.com/sveinbjornt/searchfs.git"
  sha256 "fa61d204a937c10f5fd0b054d862332d3ad492b4ea902d93a9d64d594019879d"
  version "0.1"

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
