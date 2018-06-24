class Yarn < Formula
  desc "JavaScript package manager"
  homepage "https://yarnpkg.com/"
  url "https://yarnpkg.com/downloads/1.7.0/yarn-v1.7.0.tar.gz"
  sha256 "e7720ee346b2bd7ec32b7e04517643c38648f5022c7981168321ba1636f2dca3"
  head "https://github.com/yarnpkg/yarn.git"

  devel do
    url "https://yarnpkg.com/downloads/1.8.0/yarn-v1.8.0.tar.gz"
    sha256 "3d8dc87cae99f7547b82026f818b3a14f0393cfa09337bb9adfb446d50a527a7"
  end

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
