class Jump < Formula
  desc "Helps you navigate your file system faster by learning your habits"
  homepage "https://github.com/gsamokovarov/jump"
  url "https://github.com/gsamokovarov/jump/archive/v0.21.0.tar.gz"
  sha256 "27a5cf4f48164806bd1ed6c33cf014368db8c0250a1b7f0fb6fe55827dcbaf18"
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
