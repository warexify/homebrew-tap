class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://files.pythonhosted.org/packages/ff/5c/a300808dc7283c9aedf626774c779dfd3e1da80ed138549b211c3b5eadcc/afdko-2.8.0rc0.tar.gz"
  sha256 "76429dc85f4829d7c10896dcde4898bec428529fc8c8b7381e4f4df3b06d8d50"
  head "https://github.com/adobe-type-tools/afdko.git"

  bottle :unneeded

  depends_on "python@2"

  resource "booleanOperations" do
    url "https://files.pythonhosted.org/packages/69/6c/3a75fb491bafd4d485f13b100cd0830399920ade0b605ca55052cfbec5ee/booleanOperations-0.8.0.zip"
    sha256 "62723b7cabe3e727546df945c155e2f8be9514ef8c4f3b2f0f5cdb24ebbcfdf1"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/70/3f/96f57f6f5953881f9e9e95bcbc30da43d593ebbfb3ea653786e40bbe057a/defcon-0.5.2.zip"
    sha256 "bcd6539247d034918c4df687fdaa6e64fbca939cf9b34aee506527e95190f2dc"
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
    url "https://files.pythonhosted.org/packages/2e/92/d532aa1cfcd0870cf0144c1ba0e24e38eb82bbaba5771a352c762b7e3e30/fonttools-3.29.0.zip"
    sha256 "aab38c8c131670684321437d4857dcb4de1c775efd152a9ca9c4d81f1cb97fe7"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/60/4a/2816f998d33dda49c68d22f5128372435a0799157269ad48c2952171967c/MutatorMath-2.1.1.zip"
    sha256 "3353fdd0d1beb13bda458265573bbefa0d4afb5aa5f9e4d3503cb9d3b0623f12"
  end

  resource "psautohint" do
    url "https://files.pythonhosted.org/packages/d0/d5/d660a735784c8498b099d352bf86c6cfd72f697d9e5c08f9fa2bac1397b9/psautohint-1.7.0.zip"
    sha256 "629d3e58de8cdc7d048f093b1562fd85abd817d2852760a65825d11b8ce2defc"
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
