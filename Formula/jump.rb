class Jump < Formula
  desc "Helps you navigate your file system faster by learning your habits"
  homepage "https://github.com/gsamokovarov/jump"
  url "https://github.com/gsamokovarov/jump/archive/v0.23.0.tar.gz"
  sha256 "decb93cdccf0aff1ed9ab503af320aaa723998178f1d62331e6966726e6487d2"
  head "https://github.com/gsamokovarov/jump.git"

  bottle :unneeded

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/gsamokovarov/jump").install buildpath.children
    ENV.append_path "PATH", buildpath/"src/github.com/gsamokovarov/jump"
    cd "src/github.com/gsamokovarov/jump" do
      inreplace "importer/z.go", "$HOME/.z", "$HOME/.local/share/z/data"
      system "make", "build"
      bin.install "jump"
      man1.install Dir["man/*.1"]
      prefix.install_metafiles
    end
  end

  test do
    (testpath/"test_dir").mkpath
    ENV["JUMP_HOME"] = testpath.to_s
    system "#{bin}/jump", "chdir", "#{testpath}/test_dir"
    assert_equal (testpath/"test_dir").to_s, shell_output("#{bin}/jump cd tdir").chomp
  end
end
