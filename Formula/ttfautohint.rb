class Ttfautohint < Formula
  desc "Auto-hinter for TrueType fonts"
  homepage "https://www.freetype.org/ttfautohint"
  url "https://downloads.sourceforge.net/project/freetype/ttfautohint/1.8.1/ttfautohint-1.8.1.tar.gz"
  sha256 "12df5120be194d2731e2a3c596892aa218681614c4f924e24279baf69bb7d4f9"

  head do
    url "http://repo.or.cz/ttfautohint.git"
    depends_on "bison" => :build
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "pkg-config" => :build
    depends_on "libtool" => :build
  end

  deprecated_option "with-qt5" => "with-qt"

  option "with-qt", "Build ttfautohintGUI also"

  depends_on "pkg-config" => :build
  depends_on "freetype"
  depends_on "libpng"
  depends_on "harfbuzz"
  depends_on "qt" => :optional

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --without-doc
    ]

    args << "--without-qt" if build.without? "qt"

    inreplace "./configure", "at_qmake_args='-spec macx-g++'", "at_qmake_args='-spec macx-clang'" if build.with? "qt"

    system "./bootstrap" if build.head?
    system "./configure", *args
    system "make", "install"
  end

  test do
    if build.with? "qt"
      system "#{bin}/ttfautohintGUI", "-V"
    else
      system "#{bin}/ttfautohint", "-V"
    end
  end
end
