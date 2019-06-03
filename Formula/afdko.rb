class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://github.com/adobe-type-tools/afdko/releases/download/2.8.10/afdko-2.8.10.tar.gz"
  sha256 "f38281633b1333b05477747452f8bc6499ebd778c5cf1a1f19cdc524f499d808"
  head "https://github.com/adobe-type-tools/afdko.git"

  bottle :unneeded

  depends_on "python@2"

  resource "booleanOperations" do
    url "https://files.pythonhosted.org/packages/e6/99/1ded4964e5d0c9d0d10800fadaa6b9e653f615e630e99745ea35bacc5678/booleanOperations-0.8.2.zip"
    sha256 "1750def605e53ca13cf45fedd31b360d241cc6082523e4b71d86c72dd3e9bc8a"
  end

  resource "cu2qu" do
    url "https://files.pythonhosted.org/packages/ae/f5/81b7f453c51574ea6563df5dde4c952077cb51f8d0dffffc71ff566510d2/cu2qu-1.6.5.zip"
    sha256 "b3b4a0d80798489906ca503c4a7a749e0a360670aa2f10f21dd01682e37b8293"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/bd/08/585564e4b5cb57570c604134d734334bf702fe874b4ef73c856aec136e88/defcon-0.6.0.zip"
    sha256 "52e461961b4b68ae6883f8a14a0d82f2d09f2de7a526b95c7d1b195c10ca745f"
  end

  resource "fontMath" do
    url "https://files.pythonhosted.org/packages/fd/92/66cecf473e7377cfe7597703713bf2bea3480ca5762a1bfe53b330baa6d5/fontMath-0.5.0.zip"
    sha256 "f455c8f76277ba9e9ee36d60b79c25d8ddbb20f55983713731ed0234c716e378"
  end

  resource "FontTools" do
    url "https://files.pythonhosted.org/packages/8b/2d/b6d2070306f5ecae50d22995eff1e0d041435851cd8ff41491bf28731285/fonttools-3.42.0.zip"
    sha256 "c00b393b8fb8644acc7a0c7b71d2e70eadc21db494baaa05b32b08148c661670"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/38/48/40a5391de17b90b12c566cd778e572c47b22666b23e7f7735f3117a0b737/MutatorMath-2.1.2.zip"
    sha256 "6930f966a07a7459bcdb15b36dbcb615a791853d79965897cedb1047d5beeecb"
  end

  resource "psautohint" do
    url "https://files.pythonhosted.org/packages/30/99/abdf95771e8f5fb0b1c3b812eea2fa8d1097cf0e09db74cdeaceccd38526/psautohint-1.9.2.zip"
    sha256 "6682a600de713d9a2f09dc0e520b90558c5452198668d79ecc4dd9e46b89817b"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/d7/a7/7b6ab8b83c16cf5da2776bb3631194ef4e9e54fabbe435f34763eca43d63/ufonormalizer-0.3.6.zip"
    sha256 "e41978fa581feb31ff9aec10f6e52aff27ccdd1ce242529cbc51bfe862687acf"
  end

  resource "ufoProcessor" do
    url "https://files.pythonhosted.org/packages/1f/9c/2a89d29255a66f0e59a69114fb5536cce0ca0097a05510f82d3035cae446/ufoProcessor-1.0.6.zip"
    sha256 "ce8a47ce93dbf8ffaa4e7b115ea16a683c3cc79b44841769a5cac484bc901dd3"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/makeotf", "-h"
  end
end
