class Zydis < Formula
  desc "Fast and lightweight x86/x86-64 disassembler library"
  homepage "https://zydis.re"
  url "https://github.com/zyantific/zydis/archive/v2.0.2.tar.gz"
  sha256 "bd711102a5a30096562a7cb60bafbc9c4a2441ce5463a59f4d16f2dd73f9fb72"

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
