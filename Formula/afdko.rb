class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://files.pythonhosted.org/packages/93/08/d3b6335285904196a99dd8e40c42d024df22c991d839449250605407ce02/afdko-3.8.3.tar.gz"
  sha256 "8bc868a201dce2cb4788fe207ed0857f0acb0b5d47c7d3281e51b14f14f5f456"
  head "https://github.com/adobe-type-tools/afdko.git"

  depends_on "python@3.9"

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/3b/94/e2b1b3bad91d15526c7e38918795883cee18b93f6785ea8ecf13f8ffa01e/lxml-4.8.0.tar.gz"
    sha256 "f63f62fc60e6228a4ca9abae28228f35e1bd3ce675013d1dfb828688d50c6e23"
  end

  resource "booleanOperations" do
    url "https://files.pythonhosted.org/packages/57/d9/9eae7bc4ba3a38ab7426522fb08e12df54aec27595d7bcd1bc0670aec873/booleanOperations-0.9.0.zip"
    sha256 "8cfa821c32ad374fa120d6b2e0b444ebeac57c91e6631528645fa19ac2a281b8"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/d4/4b/1488a804eeba8771c9437b5ee7aa7df32f0ab57be82ccda3ab38c11a90ee/defcon-0.10.1.zip"
    sha256 "fa7964f711b798e092e311f3a79e09fd5fa17bb1cd320d5a32015e4c54eb3070"
  end

  resource "fontMath" do
    url "https://files.pythonhosted.org/packages/b8/4a/fe75a801004b26e7be7d8949410b19193f935c1ffbdd1f701f6f3dc4f806/fontMath-0.9.1.zip"
    sha256 "1c5e76e135409f49b15809d0ce94dfd00850f893f86d4d6a336808dbbf292700"
  end

  resource "FontTools" do
    url "https://files.pythonhosted.org/packages/de/54/14376a4e5c1e7d2105a5be33ad5584b56e36753dc615506728a1489071cd/fonttools-4.33.3.zip"
    sha256 "c0fdcfa8ceebd7c1b2021240bd46ef77aa8e7408cf10434be55df52384865f8e"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/44/02/d1ddbbc5698db8ad2a0d1f8a23d52305e66166b6fea5ada5e146dd3a709a/MutatorMath-3.0.1.zip"
    sha256 "8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864"
  end

  resource "psautohint" do
    url "https://files.pythonhosted.org/packages/91/74/014da6e9280844cec6a73a04e069d95740e5520fd9477afbf31208d0e2f4/psautohint-2.4.0.tar.gz"
    sha256 "d50edea8f6121c3383f0d82f881bf7a18bdd476cc2d354737672ce193c3cff7f"
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

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/makeotf", "-h"
  end
end
