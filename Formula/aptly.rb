class Aptly < Formula
  desc "Swiss army knife for Debian repository management"
  homepage "https://www.aptly.info/"
  url "https://github.com/aptly-dev/aptly/archive/v1.3.0.tar.gz"
  sha256 "4d993dd790345e54dd963467a475ae160a7133bae7ee42844f15d5e82c1fb36e"
  head "https://github.com/aptly-dev/aptly.git"

  bottle :unneeded
  option "without-completions", "Disable bash/zsh completions"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    (buildpath/"src/github.com/aptly-dev/aptly").install buildpath.children
    cd "src/github.com/aptly-dev/aptly" do
      system "make", "VERSION=#{version}", "install"
      prefix.install_metafiles
      if build.with? "completions"
        bash_completion.install "completion.d/aptly"
        zsh_completion.install "completion.d/_aptly"
      end
    end
  end

  test do
    assert_match "aptly version:", shell_output("#{bin}/aptly version")
    (testpath/".aptly.conf").write("{}")
    result = shell_output("#{bin}/aptly -config='#{testpath}/.aptly.conf' mirror list")
    assert_match "No mirrors found, create one with", result
  end
end
