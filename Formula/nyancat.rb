class Nyancat < Formula
  desc "Renders an animated, color, ANSI-text loop of the Poptart Cat"
  homepage "https://github.com/klange/nyancat"
  url "https://github.com/klange/nyancat/archive/1.5.1.tar.gz"
  head "https://github.com/klange/nyancat.git"
  sha256 "c948c769d230b4e41385173540ae8ab1f36176de689b6e2d6ed3500e9179b50a"
  version "1.5.1"

  def install
    cd("src") do
      system "make"
      bin.install "nyancat"
    end
    man.mkpath
    man1.install "nyancat.1"
  end

  test do
    system "#{bin}/nyancat", "--frames", "1"
  end
end
