class MarathonSwift < Formula
  desc "Makes it easy to write, run and manage your Swift scripts"
  homepage "https://github.com/JohnSundell/Marathon"
  url "https://github.com/JohnSundell/Marathon/archive/3.2.0.tar.gz"
  sha256 "be40fbed247105b2f9336b9c636c638aa830bd5f6500fba09fdb48a42c6d73c6"
  head "https://github.com/JohnSundell/Marathon.git"

  bottle :unneeded

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
    bin.install ".build/release/marathon"
  end

  def caveats; <<~EOS
    To enable autocomplete for the zsh add the following to your ~/.zshrc:
    fpath=(~/.marathon/ShellAutocomplete/zsh $fpath)
    autoload -Uz compinit && compinit -i

    To enable autocomplete for the fish, do the following:
    cp -f ~/.marathon/ShellAutocomplete/fish/marathon.fish ~/.config/fish/completions
  EOS
  end

  test do
    system "#{bin}/marathon", "create", "helloWorld",
           "import Foundation\n\n; print(\"Hello world!\")", "--no-xcode",
           "--no-open"
    system "#{bin}/marathon", "run", "helloWorld"
  end
end
