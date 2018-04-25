class Yarn < Formula
  desc "JavaScript package manager"
  homepage "https://yarnpkg.com/"
  url "https://yarnpkg.com/downloads/1.6.0/yarn-v1.6.0.tar.gz"
  sha256 "a57b2fdb2bfeeb083d45a883bc29af94d5e83a21c25f3fc001c295938e988509"

  devel do
    url "https://nightly.yarnpkg.com/latest.tar.gz"
    sha256 "7f06173c0b57032e41ab00d08df0fa63ada106d49d984f2097df03936cc564b9"
    version "nightly"
  end

  head "https://github.com/yarnpkg/yarn.git"

  bottle :unneeded

  depends_on "node" => :recommended

  conflicts_with "hadoop", :because => "both install `yarn` binaries"

  def install
    libexec.install Dir["*"]
    (bin/"yarn").write_env_script "#{libexec}/bin/yarn.js", :PREFIX => HOMEBREW_PREFIX, :NPM_CONFIG_PYTHON => "/usr/bin/python"
    (bin/"yarnpkg").write_env_script "#{libexec}/bin/yarn.js", :PREFIX => HOMEBREW_PREFIX, :NPM_CONFIG_PYTHON => "/usr/bin/python"
    inreplace "#{libexec}/package.json", '"installationMethod": "tar"', '"installationMethod": "homebrew"'
  end

  test do
    (testpath/"package.json").write('{"name": "test"}')
    system bin/"yarn", "add", "jquery"
    system bin/"yarn", "add", "fsevents", "--build-from-source=true"
  end
end
