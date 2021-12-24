class Elvish < Formula
  desc "Friendly and expressive shell"
  homepage "https://github.com/elves/elvish"
  url "https://github.com/elves/elvish/archive/v0.17.0.tar.gz"
  sha256 "0e255849723129d8c4dc24f67656e651b4e4b7566bc16009109ba76099681fa1"
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
