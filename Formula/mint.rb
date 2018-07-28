class Mint < Formula
  desc "Dependency manager that installs and runs Swift command-line tool packages"
  homepage "https://github.com/yonaskolb/Mint"
  url "https://github.com/yonaskolb/Mint/archive/0.10.2.tar.gz"
  sha256 "d32be438caabc3e527a812e809f0f004dfede0959c8099e3a5ce24b526a464cc"
  head "https://github.com/yonaskolb/Mint.git"

  depends_on :xcode => ["9.0", :build]

  def install
    if MacOS::Xcode.version >= "9.0"
      system "swift", "package", "--disable-sandbox", "update"
      system "swift", "build", "-c", "release", "-Xswiftc", "-static-stdlib",
             "--disable-sandbox"
    else
      ENV.delete("CC")
      system "swift", "package", "update"
      system "swift", "build", "-c", "release", "-Xswiftc", "-static-stdlib"
    end
    bin.install ".build/release/mint"
  end

  test do
    # Test by showing the help scree
    system "#{bin}/mint", "--help"
    # Test showing list of installed tools
    system "#{bin}/mint", "list"
  end
end
