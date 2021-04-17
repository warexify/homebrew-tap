class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://files.pythonhosted.org/packages/7c/f6/e0b36bb0970e82018a5b508656ee16b6300dc1cc91f1f9b9149d5d47e7fa/afdko-3.6.2.tar.gz"
  sha256 "b1a2634848048fb235c25243c4e7148d1eb7919d91af6234cd5b805ac96c8ddd"
  head "https://github.com/adobe-type-tools/afdko.git"

  bottle :unneeded

  depends_on "python"

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/db/f7/43fecb94d66959c1e23aa53d6161231dca0e93ec500224cf31b3c4073e37/lxml-4.6.2.tar.gz"
    sha256 "cd11c7e8d21af997ee8079037fff88f16fda188a9776eb4b81c7e4c9c0a7d7fc"
  end

  resource "booleanOperations" do
    url "https://files.pythonhosted.org/packages/57/d9/9eae7bc4ba3a38ab7426522fb08e12df54aec27595d7bcd1bc0670aec873/booleanOperations-0.9.0.zip"
    sha256 "8cfa821c32ad374fa120d6b2e0b444ebeac57c91e6631528645fa19ac2a281b8"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/df/2c/4b4e3739eefb2a2d176ef42a45544e87f710cfcc164d4d9eb315616f7d49/defcon-0.7.2.zip"
    sha256 "1967eaa23dcc8e1cbe3bd130aae4d9ddb72027b62d3e23eeb640065cfbd6d8d1"
  end

  resource "fontMath" do
    url "https://files.pythonhosted.org/packages/3e/08/1df5987085c63f1d87376c811baab7f6466ee2695d5e9f131898bafccacb/fontMath-0.6.0.zip"
    sha256 "5a93002bfdcacd16b117b498f6e5ffa5d8fd263ccd8c587d9aa553e965c3ad27"
  end

  resource "FontTools" do
    url "https://files.pythonhosted.org/packages/05/57/4517c2a472db23df6a46a87b9f0d22483bbbbe74589156e70622a01b1671/fonttools-4.21.1.zip"
    sha256 "d9cf618ab76afb42a79dcc0b4b5e5ee7ec1534f7ad9da3809bb15ddfcedc073d"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/44/02/d1ddbbc5698db8ad2a0d1f8a23d52305e66166b6fea5ada5e146dd3a709a/MutatorMath-3.0.1.zip"
    sha256 "8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864"
  end

  resource "psautohint" do
    url "https://files.pythonhosted.org/packages/41/43/598368bc85ddd39253728291a1353b940337532eb7eee8a0fbcef9b4267d/psautohint-2.3.0.zip"
    sha256 "78a45b13a475fd83e99fd637bd908d91679c5fd765993cdb6cff1f48d93c3029"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/b1/43/5fbcc228769304f437f412b98be988121afff58245105ad4fdad7f8c1526/tqdm-4.58.0.tar.gz"
    sha256 "c23ac707e8e8aabb825e4d91f8e17247f9cc14b0d64dd9e97be0781e9e525bba"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/27/44/3805b98e5c17b42c17e2add281768625e80bef84fd3a8a8d4267e44ba071/ufonormalizer-0.5.3.zip"
    sha256 "7165d7ff4b58a17e498aba8e809ba5dd67e5ed2e6e411b64722ea76d4f324c46"
  end

  resource "ufoProcessor" do
    url "https://files.pythonhosted.org/packages/b0/d6/a2b248adc2f26a97752bec3719bd5d33a788890b5546bff0839baeba1b4e/ufoProcessor-1.9.0.zip"
    sha256 "baa8bd9bbbb11ce004647eb1906105f4d5bfdbc1b3388ca4d36fab57950a415b"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/makeotf", "-h"
  end
end
