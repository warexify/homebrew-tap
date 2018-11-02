class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://files.pythonhosted.org/packages/e7/f2/9ebf15ef86db023d12fdc04d4c30ae3585f8dde531b3f27a7a6e13f7f48c/afdko-2.8.3.tar.gz"
  sha256 "2d777a5c5f1d03ac963b533dca4fa374d4fc2e1d04952187b5f1bb8e50e901f6"
  head "https://github.com/adobe-type-tools/afdko.git"

  bottle :unneeded

  depends_on "python@2"

  resource "booleanOperations" do
    url "https://files.pythonhosted.org/packages/69/6c/3a75fb491bafd4d485f13b100cd0830399920ade0b605ca55052cfbec5ee/booleanOperations-0.8.0.zip"
    sha256 "62723b7cabe3e727546df945c155e2f8be9514ef8c4f3b2f0f5cdb24ebbcfdf1"
  end

  resource "cu2qu" do
    url "https://files.pythonhosted.org/packages/29/33/6186137547733d15ae15ad00bc81688d474fdbb7e1aad4ee35c1d5228936/cu2qu-1.6.4.zip"
    sha256 "8ffda9ab0dec7f6249a93432c274d62a72b9a0ee6787b8027929ced3d6585fb5"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/5a/07/5416dfe5d133b9c994ab4846af3aa9b5405dcb0e09d73b41769621d34455/defcon-0.5.3.zip"
    sha256 "4c1b45c3d8bc24ec2560f355a899f853ddb715b401862e8c99aaefdec8599de0"
  end

  resource "fontMath" do
    url "https://files.pythonhosted.org/packages/1f/de/c9962d805d03116f8f8369969f889a4337caa18e5f001fa3b844a14440dc/fontMath-0.4.7.zip"
    sha256 "6d80531c5ccdd2a6f01ce2b97b19aa133ea206a2edab26b3716d9b0306dd0bf5"
  end

  resource "fontPens" do
    url "https://files.pythonhosted.org/packages/ce/fb/22d4a4405564343c8fcc48a46812dc0f791b790e18f30a093963e6006de0/fontPens-0.1.0.zip"
    sha256 "4b26daf0ddf43bf87828e05708ca5191c754f3cf5e82a3c62b6502536d208276"
  end

  resource "FontTools" do
    url "https://files.pythonhosted.org/packages/4b/56/451957211a7e308ef0c75694c00d7cfedf3a617a09b6574bee03ee11ecb2/fonttools-3.31.0.zip"
    sha256 "c9a726a29fb4e573ee18b296e0a193ca18bc3d3ecf1c78bd4d92c77aa7a92752"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/60/4a/2816f998d33dda49c68d22f5128372435a0799157269ad48c2952171967c/MutatorMath-2.1.1.zip"
    sha256 "3353fdd0d1beb13bda458265573bbefa0d4afb5aa5f9e4d3503cb9d3b0623f12"
  end

  resource "psautohint" do
    url "https://files.pythonhosted.org/packages/c3/98/79e846ae8b0ac77a5d2a303d66e7b77a2c4c7015155ab4e8fa2006b0f3fb/psautohint-1.8.1.zip"
    sha256 "14f33792bf0ba1496b6d04e585bfff3480b6b0e896094895189f158cf08760ff"
  end

  resource "ufoLib" do
    url "https://files.pythonhosted.org/packages/90/10/a170501b56ecdc439ec1064b1f7db1e5bbab0ac052fe134b82880074e512/ufoLib-2.3.2.zip"
    sha256 "2bc337a78b104e554e3e75c7c99fa1c8b305e2f82022743a34d5c77e2bca29e5"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/4b/20/ddf5eb3bd5c57582d2b4652b4bbcf8da301bdfe5d805cb94e805f4d7464d/lxml-4.2.5.tar.gz"
    sha256 "36720698c29e7a9626a0dc802ef8885f8f0239bfd1689628ecd459a061f2807f"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/3b/78/a4045238bd89ea9e4362de370bff374583f1d7f30f71a4d1845babb24357/ufonormalizer-0.3.5.zip"
    sha256 "634d49e647f562fb4b07ac38b902a92aacd215929c157d3eef2d78f39fb335fe"
  end

  resource "ufoProcessor" do
    url "https://files.pythonhosted.org/packages/07/6f/0c6fb942e5b041cdaadcd86e4437aec357a963dc6f36a32421676b52af56/ufoProcessor-1.0.1.zip"
    sha256 "2e78d6987f7605093798714f81cae8d274a5195b86b3005425d7c3490fbf8e74"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "makeotf", "-h"
  end
end
