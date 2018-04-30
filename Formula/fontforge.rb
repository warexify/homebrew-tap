class Fontforge < Formula
  desc "Command-line outline and bitmap font editor/converter"
  homepage "https://fontforge.github.io"
  url "https://github.com/fontforge/fontforge/releases/download/20170731/fontforge-dist-20170731.tar.xz"
  sha256 "840adefbedd1717e6b70b33ad1e7f2b116678fa6a3d52d45316793b9fd808822"
  revision 3

  head "https://github.com/fontforge/fontforge.git"

  head do
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  option "with-giflib", "Build with GIF support"
  option "with-extra-tools", "Build with additional font tools"

  deprecated_option "with-gif" => "with-giflib"

  depends_on :x11 => :optional
  if build.with? "x11"
    depends_on "cairo" => "with-x11"
    depends_on "pango" => "with-x11"
  else
    depends_on "cairo"
    depends_on "pango"
  end
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "gettext"
  depends_on "zeromq"
  depends_on "czmq"
  depends_on "fontconfig"
  depends_on "libpng" => :recommended
  depends_on "jpeg" => :recommended
  depends_on "libtiff" => :recommended
  depends_on "giflib" => :optional
  depends_on "libspiro" => :optional
  depends_on "libuninameslist" => :optional
  depends_on "python@2"

  stable do
    patch do
      url "https://github.com/fontforge/fontforge/commit/9f69bd0f9.patch?full_index=1"
      sha256 "f8afa9a6ab7a71650a3f013d9872881754e1ba4a265f693edd7ba70f2ec1d525"
    end
  end

  def install
    ENV["PYTHON_CFLAGS"] = `python-config --cflags`.chomp
    ENV["PYTHON_LIBS"] = `python-config --ldflags`.chomp

    args = %W[
      --prefix=#{prefix}
      --disable-silent-rules
      --disable-dependency-tracking
      --without-x
    ]

    args << "--without-libjpeg" if build.without? "jpeg"
    args << "--without-libtiff" if build.without? "libtiff"
    args << "--without-giflib" if build.without? "giflib"
    args << "--without-libspiro" if build.without? "libspiro"
    args << "--without-libuninameslist" if build.without? "libuninameslist"

    # Fix header includes to avoid crash at runtime:
    # https://github.com/fontforge/fontforge/pull/3147
    inreplace "fontforgeexe/startnoui.c", "#include \"fontforgevw.h\"", "#include \"fontforgevw.h\"\n#include \"encoding.h\"" if build.stable?

    system "./bootstrap" if build.head?
    system "./configure", *args
    system "make"
    system "make", "install"

    # The app here is not functional.
    # If you want GUI/App support, check the caveats to see how to get it.
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
    ENV.append_path "PYTHONPATH", lib/"python2.7/site-packages"
    system "python2.7", "-c", "import fontforge; fontforge.font()"
  end
end