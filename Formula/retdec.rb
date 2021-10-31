class Retdec < Formula
  desc "Retargetable machine-code decompiler based on LLVM"
  homepage "https://retdec.com/"
  url "https://github.com/avast/retdec/archive/v4.0.tar.gz"
  sha256 "b26c2f71556dc4919714899eccdf82d2fefa5e0b3bc0125af664ec60ddc87023"
  head "https://github.com/avast/retdec.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  def install
    ENV.deparallelize
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DRETDEC_COMPILE_YARA=OFF"
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/retdec-decompiler", "--help"
  end
end
