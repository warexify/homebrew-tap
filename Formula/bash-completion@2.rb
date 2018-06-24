class BashCompletionAT2 < Formula
  desc "Programmable completion for Bash 4.1+"
  homepage "https://github.com/scop/bash-completion"
  url "https://github.com/scop/bash-completion/releases/download/2.8/bash-completion-2.8.tar.xz"
  sha256 "c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6e349bd903375f54d"
  head "https://github.com/scop/bash-completion.git"

  head do
    depends_on "automake" => :build
    depends_on "autoconf" => :build
  end

  depends_on "bash"

  conflicts_with "bash-completion", :because => "Differing version of same formula"

  def install
    inreplace "bash_completion", "readlink -f", "readlink"
    system "autoreconf", "-fvi" if build.head?
    system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}"
    ENV.deparallelize
    system "make", "install"
  end

  def caveats; <<~EOS
    Add the following to your ~/.bash_profile:
    
    for profile_file in "$(brew --prefix)"/etc/profile.d/*.sh; do
      source "$profile_file"
    done
  EOS
  end

  test do
    system "test", "-f", ". #{etc}/profile.d/bash_completion.sh"
  end
end
