class Wireproxy < Formula
  desc "Wireguard client that exposes itself as a socks5 proxy or tunnels"
  homepage "https://github.com/octeep/wireproxy"
  url "https://github.com/octeep/wireproxy/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "3779a157713b462a7b5322f1437f768ab69ae446df0ceca76c6dff7c4030e425"
  license "ISC"
  head "https://github.com/octeep/wireproxy.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"

    system "go", "build", *std_go_args, "./cmd/wireproxy"
  end

  def caveats
    "Edit #{etc}/wireproxy.conf to configure wireproxy"
  end

  service do
    run [opt_bin/"wireproxy", "--config", etc/"wireproxy.conf"]
    log_path var/"log/wireproxy.log"
    error_log_path var/"log/wireproxy.log"
    keep_alive true
    run_type :immediate
    process_type :background
  end

  test do
    system "true"
  end
end
