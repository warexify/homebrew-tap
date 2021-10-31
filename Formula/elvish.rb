class Elvish < Formula
  desc "Friendly and expressive shell"
  homepage "https://github.com/elves/elvish"
  url "https://github.com/elves/elvish/archive/v0.15.0.tar.gz"
  sha256 "761739307c68fcbc51fd46c052c0a20ae848a30dba1ce3fbb6d27f99672f58e0"
  license "BSD-2-Clause"
  head "https://github.com/elves/elvish.git"

  depends_on "go" => :build

  def install
    ENV["GOOS"] = "darwin"
    ENV["GOARCH"] = `go env GOARCH`.chomp
    ENV["GOPATH"] = `go env GOPATH`.chomp
    ENV["GOBIN"] = bin.to_s
    ENV["CGO_ENABLED"] = "0"
    system "make", "get"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/elvish -version").chomp
    assert_match "hello", shell_output("#{bin}/elvish -c 'echo hello'")
  end
end
