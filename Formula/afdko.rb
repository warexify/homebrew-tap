class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://files.pythonhosted.org/packages/97/a1/76ae4f9f35455ca58e99f21cbc5ca9bba59fa0864a203f9cc9b3235f1904/afdko-2.8.2.tar.gz"
  sha256 "677c08eaebd1c0b59ae2316016101b273421f1079f3d5659245d7fecbf916be0"
  head "https://github.com/adobe-type-tools/afdko.git"

  bottle :unneeded

  depends_on "python@2"

  resource "booleanOperations" do
    url "https://files.pythonhosted.org/packages/69/6c/3a75fb491bafd4d485f13b100cd0830399920ade0b605ca55052cfbec5ee/booleanOperations-0.8.0.zip"
    sha256 "62723b7cabe3e727546df945c155e2f8be9514ef8c4f3b2f0f5cdb24ebbcfdf1"
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
    url "https://files.pythonhosted.org/packages/7e/c2/a2070393dd8284e31d6dfd8f7537bd87aee5c4aa65127d27bf0561edac82/fonttools-3.29.1.zip"
    sha256 "a687ca070daddb7ee25e3472b631acd0e53dbf11ecdf8e76248ee556472ede9d"
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
