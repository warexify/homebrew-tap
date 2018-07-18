class Zydis < Formula
  desc "Fast and lightweight x86/x86-64 disassembler library"
  homepage "https://zydis.re"
  url "https://github.com/zyantific/zydis/archive/v2.0.1.tar.gz"
  sha256 "8fd27b5d05c5b1494606cb57bad6564a54b74a77953327c14ebc755a747380e3"

  head "https://github.com/zyantific/zydis.git"

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
