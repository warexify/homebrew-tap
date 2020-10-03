class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://github.com/adobe-type-tools/afdko/releases/download/3.5.1/afdko-3.5.1.tar.gz"
  sha256 "14568af084eee8c60cdc9443e1fac47d6e84f850597906fa426f963662fe225c"
  head "https://github.com/adobe-type-tools/afdko.git"

  bottle :unneeded

  depends_on "python"

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/2c/4d/3ec1ea8512a7fbf57f02dee3035e2cce2d63d0e9c0ab8e4e376e01452597/lxml-4.5.2.tar.gz"
    sha256 "cdc13a1682b2a6241080745b1953719e7fe0850b40a5c71ca574f090a1391df6"
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
    url "https://files.pythonhosted.org/packages/9a/ac/baa50a8bb471a2a80d498cba7d7379c76aed4a453894248346bffdd1611c/fonttools-4.14.0.zip"
    sha256 "65744b52eee9da4e6ece77e0f8be1f79ab75f30d0b161ce667e9e2e2ed00b0d1"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/44/02/d1ddbbc5698db8ad2a0d1f8a23d52305e66166b6fea5ada5e146dd3a709a/MutatorMath-3.0.1.zip"
    sha256 "8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864"
  end

  resource "psautohint" do
    url "https://files.pythonhosted.org/packages/c7/ef/9d750366d912b6ad5701b023e6591bc30d8b9870c5f594cebca53d73819f/psautohint-2.1.0.zip"
    sha256 "8ea8d643136a3a27df03ed0ff1eb937f35ae099e4621c537470b76aa131248fd"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/7c/a2/4cc95d7766a5d17ea2541d88da357d5905f75b6dbdfd17dfffd6c37647ae/tqdm-4.48.2.tar.gz"
    sha256 "564d632ea2b9cb52979f7956e093e831c28d441c11751682f84c86fc46e4fd21"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/2f/3c/7cc72dc22fcc5af362a15f7d8c04e6cfda6f730cacbbf8ba811bdda8e6a8/ufonormalizer-0.4.2.zip"
    sha256 "f2739eaa8df3cd4e60894b22679a882505252b93f12657a0993894108122c6e6"
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
