class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://files.pythonhosted.org/packages/bf/f3/3bcacf648d676761325d3e468059f35fdc585b48455edc486a45018b8f0d/afdko-2.7.2.tar.gz"
  sha256 "d31c68cf0ae2e1760bf557c0b373c9e31811cbaebe2b5fe1c34785c718484d74"

  depends_on "python@2"

  resource "booleanOperations" do
    url "https://files.pythonhosted.org/packages/69/6c/3a75fb491bafd4d485f13b100cd0830399920ade0b605ca55052cfbec5ee/booleanOperations-0.8.0.zip"
    sha256 "62723b7cabe3e727546df945c155e2f8be9514ef8c4f3b2f0f5cdb24ebbcfdf1"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/bc/74/b7905c0dfad08f8524ffd6257759e2f6c98abd158769362f6976347c0d86/defcon-0.5.1.zip"
    sha256 "782824bc0554f7e68c8da5d53729571cb5d9316eb5f95b14ca19953b8b9c01aa"
  end

  resource "fontMath" do
    url "https://files.pythonhosted.org/packages/b0/c5/f019c56898af429fa5561e0fa7cf0f132655adf27447a56bc7861b155ea7/fontMath-0.4.5.zip"
    sha256 "a35dde1d500bcb9d659916aa820f31bc7184fe4950708ffc00450e9ecd6c243f"
  end

  resource "fontPens" do
    url "https://files.pythonhosted.org/packages/ce/fb/22d4a4405564343c8fcc48a46812dc0f791b790e18f30a093963e6006de0/fontPens-0.1.0.zip"
    sha256 "4b26daf0ddf43bf87828e05708ca5191c754f3cf5e82a3c62b6502536d208276"
  end

  resource "FontTools" do
    url "https://files.pythonhosted.org/packages/03/82/7b884380da2d96c5032cd061920399219bbc9e918cf57d541d0e6f727504/fonttools-3.27.0.zip"
    sha256 "5ef5cb2f0b5a4c1e0c1ca4358587479d86f8b53cd7a2939e3add52671afb7904"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/60/4a/2816f998d33dda49c68d22f5128372435a0799157269ad48c2952171967c/MutatorMath-2.1.1.zip"
    sha256 "3353fdd0d1beb13bda458265573bbefa0d4afb5aa5f9e4d3503cb9d3b0623f12"
  end

  resource "pyclipper" do
    url "https://files.pythonhosted.org/packages/20/a3/a60a7bad5246d66f3c54127b34b90e6d34b2cc006b84135bfcbfee4514b1/pyclipper-1.1.0.post1.zip"
    sha256 "8a8b6018d53fcce291f78dedca19994f82695eed3a2c9eff275691d4ed9aab51"
  end

  resource "ufoLib" do
    url "https://files.pythonhosted.org/packages/0c/40/bd3590eb0a16a3b6e2527dad97555258eb81d421731f33c2acecac8200c5/ufoLib-2.1.1.zip"
    sha256 "34fd6a7492350526beac0d108a6cf8f6059c629150300a864a91837f7a351e1f"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/3b/78/a4045238bd89ea9e4362de370bff374583f1d7f30f71a4d1845babb24357/ufonormalizer-0.3.5.zip"
    sha256 "634d49e647f562fb4b07ac38b902a92aacd215929c157d3eef2d78f39fb335fe"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "makeotf", "-h"
  end
end
