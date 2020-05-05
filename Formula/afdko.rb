class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://github.com/adobe-type-tools/afdko/releases/download/3.3.0/afdko-3.3.0.tar.gz"
  sha256 "14568af084eee8c60cdc9443e1fac47d6e84f850597906fa426f963662fe225c"
  head "https://github.com/adobe-type-tools/afdko.git"

  bottle :unneeded

  depends_on "python"

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/39/2b/0a66d5436f237aff76b91e68b4d8c041d145ad0a2cdeefe2c42f76ba2857/lxml-4.5.0.tar.gz"
    sha256 "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
  end

  resource "booleanOperations" do
    url "https://files.pythonhosted.org/packages/57/d9/9eae7bc4ba3a38ab7426522fb08e12df54aec27595d7bcd1bc0670aec873/booleanOperations-0.9.0.zip"
    sha256 "8cfa821c32ad374fa120d6b2e0b444ebeac57c91e6631528645fa19ac2a281b8"
  end

  resource "cu2qu" do
    url "https://files.pythonhosted.org/packages/bb/5d/dbb86b992870c8a828d893d036a5b09c9022ed603fee45b30e390ea34a65/cu2qu-1.6.7.zip"
    sha256 "559e962539c27a2964e7a2693c7053eacdabf771f0103e83baaadfa567bd8139"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/bd/08/585564e4b5cb57570c604134d734334bf702fe874b4ef73c856aec136e88/defcon-0.6.0.zip"
    sha256 "52e461961b4b68ae6883f8a14a0d82f2d09f2de7a526b95c7d1b195c10ca745f"
  end

  resource "fontMath" do
    url "https://files.pythonhosted.org/packages/41/f9/2f15d1366646bf87d9ad380034174d15e950ff6858d79e5009bf6f3eebc3/fontMath-0.5.2.zip"
    sha256 "9f7934f85859f057f8e6ff3fc2e80c1cd3ba8c9021e71a7794efdf74c6a49ce2"
  end

  resource "FontTools" do
    url "https://files.pythonhosted.org/packages/12/b4/7f5e17c48a656ceb066778eed3101ce2260eea4664560f859a9abeb3153c/fonttools-4.8.1.zip"
    sha256 "596c0e8399c650dbf1048b7ca6fc7b12bd79a7db0981f3b87743de8c2b7512de"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/44/02/d1ddbbc5698db8ad2a0d1f8a23d52305e66166b6fea5ada5e146dd3a709a/MutatorMath-3.0.1.zip"
    sha256 "8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864"
  end

  resource "psautohint" do
    url "https://files.pythonhosted.org/packages/32/a8/e4c1e38f8e82f0db68123f3ac01e2bec6ef60586dd543df7030d0299892f/psautohint-2.0.1.zip"
    sha256 "43a12f3d49fc2c1d44fbd8bad64ca3391e3e44f377ce918a583dc99dbda475b5"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/d5/1a/09441971eb061596b3ae77531c4b7858162ccd3c24706704651806617156/ufonormalizer-0.4.1.zip"
    sha256 "44d7367fc639dcbee24393f07925955f2e9347d23a4de73f2fcaeb434f07685b"
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
