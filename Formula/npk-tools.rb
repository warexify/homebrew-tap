class NpkTools < Formula
  desc "iASL compiler/disassembler"
  homepage "https://github.com/rsa9000/npk-tools"
  url "https://github.com/rsa9000/npk-tools/archive/npk-tools-1.1.tar.gz"
  sha256 "c24da339080e240c8282bbbbdb7deed129be249209711ed54c78a01f08baa346"
  version "1.1"

  def install
    system "make"
    bin.install "unnpk"
  end

  test do
    system "#{bin}/unnpk"
  end
end
