class GenerateIpv6Address < Formula
  desc "Simple tool to generate local ipv6 addresses"
  homepage "https://github.com/althea-net/generate-ipv6-address/"
  url "https://github.com/althea-net/generate-ipv6-address/releases/download/v0.1/generate-ipv6-address-0.1.tar.gz"
  sha256 "efe67ae3ef326ce48dc7d9b5255676b605479c27974bf077b96b1e69b5528504"
  head "https://github.com/althea-net/generate-ipv6-address.git"

  depends_on "gcc" => :build

  def install
    ENV.deparallelize
    system "make", "PREFIX=#{prefix}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/generate-ipv6-address", "-p"
  end
end
