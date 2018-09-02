class Alot < Formula
  include Language::Python::Virtualenv

  desc "Text mode MUA using notmuch mail"
  homepage "https://github.com/pazz/alot"
  url "https://github.com/pazz/alot/archive/0.7.tar.gz"
  sha256 "2d49a7d61241cfadc993a8456076605b2cfe264c51f5e3f18f337bad58f29a1c"
  head "https://github.com/pazz/alot.git"

  bottle :unneeded

  option "without-sphinx-doc", "Don't build documentation"

  depends_on "swig" => :build
  depends_on "gpgme"
  depends_on "libmagic"
  depends_on "notmuch"
  depends_on "python"
  depends_on "sphinx-doc" => [:build, :recommended]

  resource "Automat" do
    url "https://files.pythonhosted.org/packages/4a/4f/64db3ffda8828cb0541fe949354615f39d02f596b4c33fb74863756fc565/Automat-0.7.0.tar.gz"
    sha256 "cbd78b83fa2d81fe2a4d23d258e1661dd7493c9a50ee2f1a5b2cac61c1793b0e"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/0f/9e/26b1d194aab960063b266170e53c39f73ea0d0d3f5ce23313e0ec8ee9bdf/attrs-18.2.0.tar.gz"
    sha256 "10cbf6e27dbce8c30807caf056c8eb50917e0eaafe86347671b57254006c3e69"
  end

  resource "configobj" do
    url "https://files.pythonhosted.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz"
    sha256 "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
  end

  resource "constantly" do
    url "https://files.pythonhosted.org/packages/95/f1/207a0a478c4bb34b1b49d5915e2db574cadc415c9ac3a7ef17e29b2e8951/constantly-15.1.0.tar.gz"
    sha256 "586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35"
  end

  resource "gpg" do
    url "https://files.pythonhosted.org/packages/ef/86/c5a34243a932346c59cb25eb49a4d1dec227974209eb9b618d0ed57ea5be/gpg-1.10.0.tar.gz"
    sha256 "349214a866c84aa548bc35ed14eccd2ec9085b3958d5753a63a19a71a1f523ca"
  end

  resource "hyperlink" do
    url "https://files.pythonhosted.org/packages/41/e1/0abd4b480ec04892b1db714560f8c855d43df81895c98506442babf3652f/hyperlink-18.0.0.tar.gz"
    sha256 "f01b4ff744f14bc5d0a22a6b9f1525ab7d6312cb0ff967f59414bbac52f0a306"
  end

  resource "incremental" do
    url "https://files.pythonhosted.org/packages/8f/26/02c4016aa95f45479eea37c90c34f8fab6775732ae62587a874b619ca097/incremental-17.5.0.tar.gz"
    sha256 "7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3"
  end

  resource "python-magic" do
    url "https://files.pythonhosted.org/packages/84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-0.4.15.tar.gz"
    sha256 "f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "Twisted" do
    url "https://files.pythonhosted.org/packages/90/50/4c315ce5d119f67189d1819629cae7908ca0b0a6c572980df5cc6942bc22/Twisted-18.7.0.tar.bz2"
    sha256 "95ae985716e8107816d8d0df249d558dbaabb677987cc2ace45272c166b267e4"
  end

  resource "urwid" do
    url "https://files.pythonhosted.org/packages/c7/90/415728875c230fafd13d118512bde3184d810d7bf798a631abc05fac09d0/urwid-2.0.1.tar.gz"
    sha256 "644d3e3900867161a2fc9287a9762753d66bd194754679adb26aede559bcccbc"
  end

  resource "urwidtrees" do
    url "https://files.pythonhosted.org/packages/88/9d/981617fa083a75cf0b5ebb0ae47c3af6fb69183be1c74cc3ac6d9a0c5964/urwidtrees-1.0.1.1.tar.gz"
    sha256 "08a66d0e76e94bc32bc590e35ed283e8a6b0c93adeb431dc576ec0a345f09bfd"
  end

  resource "zope.interface" do
    url "https://files.pythonhosted.org/packages/ac/8a/657532df378c2cd2a1fe6b12be3b4097521570769d4852ec02c24bd3594e/zope.interface-4.5.0.tar.gz"
    sha256 "57c38470d9f57e37afb460c399eb254e7193ac7fb8042bd09bdc001981a9c74c"
  end

  def install
    virtualenv_install_with_resources
    pkgshare.install Dir["extra/*"] - %w[extra/completion]
    zsh_completion.install "extra/completion/alot-completion.zsh" => "_alot"

    if build.with? "sphinx-doc"
      ENV["LC_ALL"] = "en_US.UTF-8"
      ENV["SPHINXBUILD"] = Formula["sphinx-doc"].opt_bin/"sphinx-build"
      cd "docs" do
        system "make", "pickle"
        system "make", "man", "html"
        man1.install "build/man/alot.1"
        doc.install Dir["build/html/*"]
      end
    end
  end

  test do
    (testpath/".notmuch-config").write "[database]\npath=#{testpath}/Mail"
    (testpath/"Mail").mkpath
    system Formula["notmuch"].bin/"notmuch", "new"

    begin
      pid = fork do
        $stdout.reopen("/dev/null")
        $stdin.reopen("/dev/null")
        exec "script", "-q", "/dev/null", bin/"alot", "--logfile", testpath/"out.log"
      end
      sleep 10
    ensure
      Process.kill 9, pid
    end

    assert_predicate testpath/"out.log", :exist?, "out.log file should exist"
    assert_match "setup gui", File.read(testpath/"out.log")
  end
end
