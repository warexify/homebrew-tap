class Fontforge < Formula
  desc "Command-line outline and bitmap font editor/converter"
  homepage "https://fontforge.github.io"
  url "https://github.com/fontforge/fontforge/releases/download/20190801/fontforge-20190801.tar.gz"
  sha256 "d92075ca783c97dc68433b1ed629b9054a4b4c74ac64c54ced7f691540f70852"
  head "https://github.com/fontforge/fontforge.git"

  bottle :unneeded

  head do
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  option "with-extra-tools", "Build with additional font tools"

  depends_on "pkg-config" => :build
  depends_on "cairo"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "gettext"
  depends_on "giflib" => :optional
  depends_on "glib"
  depends_on "jpeg" => :recommended
  depends_on "libpng"
  depends_on "libspiro" => :optional
  depends_on "libtiff" => :recommended
  depends_on "libtool"
  depends_on "libuninameslist" => :optional
  depends_on "pango"
  depends_on "python"
  depends_on "readline"
  depends_on "woff2" => :recommended
  uses_from_macos "libxml2"

def install
    ENV["PYTHON_CFLAGS"] = `python3-config --cflags`.chomp
    ENV["PYTHON_LIBS"] = `python3-config --ldflags`.chomp

    args = %W[
      --prefix=#{prefix}
      --enable-python-scripting=3
      --disable-silent-rules
      --disable-dependency-tracking
      --without-x
    ]

    args << "--without-libjpeg" if build.without? "jpeg"
    args << "--without-libtiff" if build.without? "libtiff"
    args << "--without-giflib" if build.without? "giflib"
    args << "--without-libspiro" if build.without? "libspiro"
    args << "--without-libuninameslist" if build.without? "libuninameslist"
    args << "--enable-woff2" if build.without? "woff2"

    system "./bootstrap" if build.head?
    system "./configure", *args
    system "make"
    system "make", "install"

    (pkgshare/"osx/FontForge.app").rmtree

    if build.with? "extra-tools"
      cd "contrib/fonttools" do
        system "make"
        bin.install Dir["*"].select { |f| File.executable? f }
      end
    end
  end

  def caveats; <<~EOS
    This formula only installs the command line utilities.

    FontForge.app can be downloaded directly from the website:
      https://fontforge.github.io

    Alternatively, install with Homebrew-Cask:
      brew cask install fontforge
  EOS
  end

  test do
    system bin/"fontforge", "-version"
    system bin/"fontforge", "-lang=py", "-c", "import fontforge; fontforge.font()"
    xy = Language::Python.major_minor_version "python3"
    ENV.append_path "PYTHONPATH", lib/"python#{xy}/site-packages"
    system "python3", "-c", "import fontforge; fontforge.font()"
  end
end
