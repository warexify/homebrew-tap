class Woff2 < Formula
  desc "Compress fonts with Brotli into WOFF2 format"
  homepage "https://github.com/google/woff2"
  url "https://github.com/google/woff2/archive/v1.0.2.tar.gz"
  version "1.0.2"
  sha256 "add272bb09e6384a4833ffca4896350fdb16e0ca22df68c0384773c67a175594"

  head "https://github.com/google/woff2.git"

  depends_on "brotli" => :build
  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    bin.install "woff2_compress"
    bin.install "woff2_decompress"
    lib.install "libwoff2common.1.0.2.dylib"
    lib.install "libwoff2dec.1.0.2.dylib"
    lib.install "libwoff2enc.1.0.2.dylib"
  end
end
