class Zydis < Formula
  desc "Fast and lightweight x86/x86-64 disassembler library"
  homepage "https://zydis.re"
  url "https://github.com/zyantific/zydis/archive/v3.1.0.tar.gz"
  sha256 "fc543fef03137e63be4b6153c597f413c8de5e25414a0bc35dbd6ffbc383990d"

  head "https://github.com/zyantific/zydis.git"

  bottle :unneeded

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    bin.install "FormatterHooks"
    bin.install "ZydisDisasm"
    bin.install "ZydisFuzzIn"
    bin.install "ZydisInfo"
    bin.install "ZydisPerfTest"
    include.install Dir["include/*"]
    include.install "ZydisExportConfig.h"
    lib.install "libZydis.a"
  end
end
