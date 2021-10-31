class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://files.pythonhosted.org/packages/d4/cf/970806badb154e9b0d1c902c0d12aee26ab5c083ce9c94fc8b4bb25015d1/afdko-3.7.1.tar.gz"
  sha256 "ed827c9df740e6bdeb7b3f975d5fc16b65b7d36a65b65f5e54d2dd3b78151216"
  head "https://github.com/adobe-type-tools/afdko.git"

  depends_on "python@3.9"

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/e5/21/a2e4517e3d216f0051687eea3d3317557bde68736f038a3b105ac3809247/lxml-4.6.3.tar.gz"
    sha256 "39b78571b3b30645ac77b95f7c69d1bffc4cf8c3b157c435a34da72e78c82468"
  end

  resource "booleanOperations" do
    url "https://files.pythonhosted.org/packages/57/d9/9eae7bc4ba3a38ab7426522fb08e12df54aec27595d7bcd1bc0670aec873/booleanOperations-0.9.0.zip"
    sha256 "8cfa821c32ad374fa120d6b2e0b444ebeac57c91e6631528645fa19ac2a281b8"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/31/94/f9c0112cc40c89d6d224a6aa61c1999ba8e17ef9f2bafdfb574a198a59f3/defcon-0.9.0.zip"
    sha256 "140f51da51e9630a9fa11dfd34376c4e29785fdb0bddc2e371df5b36bec17b76"
  end

  resource "fontMath" do
    url "https://files.pythonhosted.org/packages/32/bb/5139dec458d2e407e2f9decfb08d7422ed2300fa29117d48effc78395c89/fontMath-0.8.1.zip"
    sha256 "39d71e8b7eeb33c0ddc25e94c1ae64bf29340aeea443f4327392f2be38175f54"
  end

  resource "FontTools" do
    url "https://files.pythonhosted.org/packages/15/10/c087a7e87346332e40ef24f2a18e3b288b0c0e8196c02e06f94ba4d964b7/fonttools-4.26.2.zip"
    sha256 "c1c0e03dd823e9e905232e875ea02dbb2dcd2ba195418c6d11bfaea49b9c774d"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/44/02/d1ddbbc5698db8ad2a0d1f8a23d52305e66166b6fea5ada5e146dd3a709a/MutatorMath-3.0.1.zip"
    sha256 "8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864"
  end

  resource "psautohint" do
    url "https://files.pythonhosted.org/packages/bc/58/dceb8b9fbbe9b2e17c7cedfdcd17131240e9685c724f5ede3f3f7c3755fd/psautohint-2.3.1.zip"
    sha256 "ff2529dfd7cc58cf8b709714b9abd3468354742f18c1a140eb252e18f41a51d4"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/37/e5/1b54ef934d731576d0145bc8ae22da5b410f96922cec52b91cc29d3ff1b6/tqdm-4.62.2.tar.gz"
    sha256 "a4d6d112e507ef98513ac119ead1159d286deab17dffedd96921412c2d236ff5"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/68/8e/e01860b17be1c0de7054ca2f1e985a73117b0632e12ae6c79f71e4f7fb53/ufonormalizer-0.6.0.zip"
    sha256 "adb77deef88b8c1e13556c72d04d49f829ea978674380a963c7a76f236c58470"
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
