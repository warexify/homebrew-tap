class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://github.com/adobe-type-tools/afdko/releases/download/3.6.2a1/afdko-3.6.2a1.tar.gz"
  sha256 "02d8064bac6249acea48c02033816ef14b3608ff6d1a28cdac85096485e36043"
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
    url "https://files.pythonhosted.org/packages/97/10/fff006d7a88faa7b959fdf97cebe348afb6d61f626790298821d136d1f79/fonttools-4.19.1.zip"
    sha256 "4a2b8450bd3b1c23e6259d37c0f1e403519c91b8373b83bb9e3c6e70748cf07b"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/44/02/d1ddbbc5698db8ad2a0d1f8a23d52305e66166b6fea5ada5e146dd3a709a/MutatorMath-3.0.1.zip"
    sha256 "8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864"
  end

  resource "psautohint" do
    url "https://files.pythonhosted.org/packages/c4/02/619a83fba0db10443c9cd68ed6ce6de38fef12d55d7f8e2a0c148ea775c8/psautohint-2.2.0.zip"
    sha256 "4e3c6e62c8c890492987b69904d06cc313b79aa99104d35b60cbed60fbbc8485"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/69/50/9f29874d835945b845812799edc732ba30c41e9d20431f9f69c8ffb9c670/tqdm-4.56.0.tar.gz"
    sha256 "fe3d08dd00a526850568d542ff9de9bbc2a09a791da3c334f3213d8d0bbbca65"
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
