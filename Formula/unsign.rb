class Unsign < Formula
  desc "Remove code signatures from OSX Mach-O binaries"
  homepage "http://www.woodmann.com/collaborative/tools/index.php/Unsign"
  head "https://github.com/steakknife/unsign.git"

  def install
    system "make"
    bin.install "unsign"
  end
end
