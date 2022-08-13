class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://files.pythonhosted.org/packages/4f/88/6220a2fd51ecaad0058ecc651a3c4066f2a991c55ce2fa3d9572a52ab196/afdko-3.9.2b0.tar.gz"
  sha256 "a1ded2cdef6f36b43b76258d5866bf2b37bccd836b93915432f03fc010e14313"
  head "https://github.com/adobe-type-tools/afdko.git"

  depends_on "python@3.9"

  resource "appdirs" do
    url "https://files.pythonhosted.org/packages/d7/d8/05696357e0311f5b5c316d7b95f46c669dd9c15aaeecbb48c7d0aeb88c40/appdirs-1.4.4.tar.gz"
    sha256 "7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41"
  end

  resource "booleanOperations" do
    url "https://files.pythonhosted.org/packages/57/d9/9eae7bc4ba3a38ab7426522fb08e12df54aec27595d7bcd1bc0670aec873/booleanOperations-0.9.0.zip"
    sha256 "8cfa821c32ad374fa120d6b2e0b444ebeac57c91e6631528645fa19ac2a281b8"
  end

  resource "Brotli" do
    url "https://files.pythonhosted.org/packages/2a/18/70c32fe9357f3eea18598b23aa9ed29b1711c3001835f7cf99a9818985d0/Brotli-1.0.9.zip"
    sha256 "4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/7c/31/54dd2c63f4b8253d776d03e3a38e16a0013beef5969b5813441af6764a42/defcon-0.10.2.zip"
    sha256 "aee396e6d69e45ae65c8264781392d4c29116934b2737ad76d8230b40c182a44"
  end

  resource "fontMath" do
    url "https://files.pythonhosted.org/packages/b4/71/a6165862dcd6c30259b3ba9fc834a59a0e11b2c34f44f9e1d1eb6cc674d5/fontMath-0.9.2.zip"
    sha256 "4c8b1c711e1cbf4ba93c3d0843935b0661973131261af08608bde17de1018404"
  end

  resource "fontParts" do
    url "https://files.pythonhosted.org/packages/46/f0/d794b3723ac4434138d5bbf7c73118490aa6a4688f9d41f2731606db81be/fontParts-0.10.7.zip"
    sha256 "bb484a2362cb5805062154440a4e9be72ed42a0247531d88f11e50faa90ac5c8"
  end

  resource "fontPens" do
    url "https://files.pythonhosted.org/packages/e8/25/ad6b67e7c1e00798ceac95f0cb3abfb82f83f6373e553caf4976855c534f/fontPens-0.2.4.zip"
    sha256 "a6d9a14573b3450f3313d69523f9006028c21fc7aef5d35333b87aab7f2b41fd"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/5a/a4/a97cff4c4af6764a04cc202299e5205b2e101cb1543bcaf9737be29f78ab/fonttools-4.34.4.zip"
    sha256 "9a1c52488045cd6c6491fd07711a380f932466e317cb8e016fc4e99dc7eac2f0"
  end

  resource "fs" do
    url "https://files.pythonhosted.org/packages/5d/a9/af5bfd5a92592c16cdae5c04f68187a309be8a146b528eac3c6e30edbad2/fs-2.4.16.tar.gz"
    sha256 "ae97c7d51213f4b70b6a958292530289090de3a7e15841e108fbe144f069d313"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/70/bb/7a2c7b4f8f434aa1ee801704bf08f1e53d7b5feba3d5313ab17003477808/lxml-4.9.1.tar.gz"
    sha256 "fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/44/02/d1ddbbc5698db8ad2a0d1f8a23d52305e66166b6fea5ada5e146dd3a709a/MutatorMath-3.0.1.zip"
    sha256 "8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864"
  end

  resource "psautohint" do
    url "https://files.pythonhosted.org/packages/91/74/014da6e9280844cec6a73a04e069d95740e5520fd9477afbf31208d0e2f4/psautohint-2.4.0.tar.gz"
    sha256 "d50edea8f6121c3383f0d82f881bf7a18bdd476cc2d354737672ce193c3cff7f"
  end

  resource "pyclipper" do
    url "https://files.pythonhosted.org/packages/45/9e/0ad12b045017ab57a05844084d376569a023c604b1061065c604fa3bf953/pyclipper-1.3.0.post3.tar.gz"
    sha256 "639fbc55569b94487f89261b1656e3e655d06888a582218c5432c426705d1f6f"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/98/2a/838de32e09bd511cf69fe4ae13ffc748ac143449bfc24bb3fd172d53a84f/tqdm-4.64.0.tar.gz"
    sha256 "40be55d30e200777a307a7585aee69e4eabb46b4ec6a4b4a5f2d9f11e7d5408d"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/46/23/5eadf42d61b32310c735d0d5e219073f39c18f7bca5c2143363e914927dd/ufonormalizer-0.6.1.zip"
    sha256 "e61110e75a500083f265385b1354b578610f9542e3bbbeedb98a2a6155e4aa6c"
  end

  resource "ufoProcessor" do
    url "https://files.pythonhosted.org/packages/b0/d6/a2b248adc2f26a97752bec3719bd5d33a788890b5546bff0839baeba1b4e/ufoProcessor-1.9.0.zip"
    sha256 "baa8bd9bbbb11ce004647eb1906105f4d5bfdbc1b3388ca4d36fab57950a415b"
  end

  resource "unicodedata2" do
    url "https://files.pythonhosted.org/packages/e8/10/85680b43276df4c485f1f14598681d8fd654aebd52872a8be405607cabaa/unicodedata2-14.0.0.tar.gz"
    sha256 "41f7df0043f4450e84203d907a56cdd2a0a0541a9eebbaba48576b01e0b61684"
  end

  resource "zopfli" do
    url "https://files.pythonhosted.org/packages/91/25/ba6f370e18359292f05ca4df93642eb7d1c424721ef61f61b8610a63d0c5/zopfli-0.2.1.zip"
    sha256 "e5263d2806e2c1ccb23f52b2972a235d31d42f22f3fa3032cc9aded51e9bf2c6"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/makeotf", "-h"
  end
end
