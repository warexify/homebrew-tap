class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://github.com/adobe-type-tools/afdko/releases/download/3.6.0/afdko-3.6.0.tar.gz"
  sha256 "c79309faa12e5c7d201bc39359c2cf3103d704b7cbf2751190344e95b9f768bd"
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
    url "https://files.pythonhosted.org/packages/3d/f9/ebd619f1393d4536bbf4becb9ffc41d95d01b38441244b28fa39b827db4a/fonttools-4.18.2.zip"
    sha256 "5c50af6fb9b4de4609c0e5558f3444c20f8632aa319319a7ef14fd5ba677c9f8"
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
    url "https://files.pythonhosted.org/packages/80/e9/a51c724ce67ff24a18861af5b0c6f9468e4b4ecdbd53fd43a9288b856372/tqdm-4.54.1.tar.gz"
    sha256 "38b658a3e4ecf9b4f6f8ff75ca16221ae3378b2e175d846b6b33ea3a20852cf5"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/e6/98/c329e162c0b6829bd473cb50c7cc933ce14ecfbbf541d56d92768f435592/ufonormalizer-0.5.2.zip"
    sha256 "f2d543d82648cc2ffe2b2d1de882b9116f19955d08f3829df6e38e6d9b6d690e"
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
