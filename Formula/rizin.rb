class Rizin < Formula
  desc "UNIX-like reverse engineering framework and command-line toolset"
  homepage "https://rizin.re"
  url "https://github.com/rizinorg/rizin/releases/download/v0.2.1/rizin-src-v0.2.1.tar.xz"
  sha256 "97156c3c8faa2de9d9d297a5bf1b47950e9f8567507aaa04107ad4199e517668"
  license "LGPL-3.0-only"
  head "https://github.com/rizinorg/rizin.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build

  def install
    system "meson", "subprojects", "download" if build.head?
    system "meson", "--buildtype=release", "--prefix=#{prefix}", "build"
    system "ninja", "-C", "build"
    system "ninja", "-C", "build", "install"
  end

  test do
    assert_match "rizin #{version}", shell_output("#{bin}/rizin -v")
  end
end
