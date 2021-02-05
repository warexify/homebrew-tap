class Osxiconutils < Formula
  desc "Set of command-line utilities for working with Mac icns files"
  homepage "https://sveinbjorn.org/osxiconutils"
  url "https://sveinbjorn.org/files/software/osxiconutils.zip"
  version "0.1"
  sha256 "d7a58dc32a5a8596973c2aee3c5698d28ca5df7650882b18e9bfa295a5241f83"
  head "https://github.com/sveinbjornt/osxiconutils.git"

  bottle :unneeded

  def install
    if build.stable?
      bin.install "bin/geticon"
      bin.install "bin/icns2image"
      bin.install "bin/image2icns"
      bin.install "bin/seticon"
      man.mkpath
      man1.install "bin/geticon.1"
      man1.install "bin/icns2image.1"
      man1.install "bin/image2icns.1"
      man1.install "bin/seticon.1"
    end

    if build.head?
      system "./build.sh"
      bin.install "bin/geticon"
      bin.install "bin/icns2image"
      bin.install "bin/image2icns"
      bin.install "bin/seticon"
      man.mkpath
      man1.install "bin/geticon.1"
      man1.install "bin/icns2image.1"
      man1.install "bin/image2icns.1"
      man1.install "bin/seticon.1"
    end
  end

  test do
    system "#{bin}/icns2image", "--help"
  end
end
