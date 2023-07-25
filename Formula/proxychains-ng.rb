class ProxychainsNg < Formula
  desc "Proxychains is a hook preloader"
  homepage "https://github.com/rofl0r/proxychains-ng"
  url "https://github.com/rofl0r/proxychains-ng/releases/download/v4.16/proxychains-ng-4.16.tar.xz"
  version "4.16"
  sha256 "37a9983d995857cc398cfeefb96739827b3d86a71e03a5193b99f1b097046812"
  license "GPL-2.0"
  head "https://github.com/rofl0r/proxychains-ng.git"

  depends_on "pkg-config"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
    system "make", "install-config"
  end

  test do
    system "false"
  end
end
