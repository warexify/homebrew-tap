class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://files.pythonhosted.org/packages/f6/48/33429c27f4f3fe096e5c8d92ea9c83913354d72e826dc77ec558854d7fa0/afdko-2.7.3a4.tar.gz"
  sha256 "0a5c4fd5b085a1377ae02ad272417f1a84224bbf3b48729ad49915b920e2dcc1"

  bottle :unneeded

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
    url "https://files.pythonhosted.org/packages/2e/92/d532aa1cfcd0870cf0144c1ba0e24e38eb82bbaba5771a352c762b7e3e30/fonttools-3.29.0.zip"
    sha256 "aab38c8c131670684321437d4857dcb4de1c775efd152a9ca9c4d81f1cb97fe7"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/60/4a/2816f998d33dda49c68d22f5128372435a0799157269ad48c2952171967c/MutatorMath-2.1.1.zip"
    sha256 "3353fdd0d1beb13bda458265573bbefa0d4afb5aa5f9e4d3503cb9d3b0623f12"
  end

  resource "ufoLib" do
    url "https://files.pythonhosted.org/packages/b4/9e/e508b19cb9b0fb3b5a8d06e6a10d7a4dd06899cf97cf35a664c00d12acc5/ufoLib-2.3.1.zip"
    sha256 "6deceb5e4aeef719b3fadc631450da74c01def48b7ee4d25753a41261f69e6cb"
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
