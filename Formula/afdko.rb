class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://github.com/adobe-type-tools/afdko"
  url "https://files.pythonhosted.org/packages/be/45/34649db3426bb54471bf3a5f3ad9d5099bcec0a0ea3d0e0a719dcff3c354/afdko-2.7.0.tar.gz"
  sha256 "e77a540aa8e6de248f1987149cd3604676a50534e4c54bdeec5400fcb2da1b56"

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
    url "https://files.pythonhosted.org/packages/a6/7a/2ce3ee4d85ded137339d1d65ae693870409dff626393acbfc185e088cd37/fontMath-0.4.4.zip"
    sha256 "2a7bbee59c2e06659e95c3e9c4a656d19fe0584a2f2bc711588e1c884e14bf14"
  end

  resource "fontPens" do
    url "https://files.pythonhosted.org/packages/ce/fb/22d4a4405564343c8fcc48a46812dc0f791b790e18f30a093963e6006de0/fontPens-0.1.0.zip"
    sha256 "4b26daf0ddf43bf87828e05708ca5191c754f3cf5e82a3c62b6502536d208276"
  end

  resource "FontTools" do
    url "https://files.pythonhosted.org/packages/c5/91/20c29fa1412f5182da2bd8dfae78276d70469e1826d553b0fbc995f143da/fonttools-3.25.0.zip"
    sha256 "c1b7eb0469d4e684bb8995906c327109beac870a33900090d64f85d79d646360"
  end

  resource "MutatorMath" do
    url "https://files.pythonhosted.org/packages/39/95/ea9f0c9c4ba18491eac11f316fbe7458860cabe6726c97ab325bd8be56a3/MutatorMath-2.1.0.zip"
    sha256 "ebf8291637c7de30fe83f9402dad17c6ac9e1feb16d530e0a560d8e6abf48fce"
  end

  resource "pyclipper" do
    url "https://files.pythonhosted.org/packages/7c/8a/dca05b87240b297f7508e3e7687921103770069f3247b94311087f877414/pyclipper-1.1.0.zip"
    sha256 "3f11e87f0b82bccc6de57eead2628ca419694352e8b843bcd228eec9c9357680"
  end

  resource "ufoLib" do
    url "https://files.pythonhosted.org/packages/0c/40/bd3590eb0a16a3b6e2527dad97555258eb81d421731f33c2acecac8200c5/ufoLib-2.1.1.zip"
    sha256 "34fd6a7492350526beac0d108a6cf8f6059c629150300a864a91837f7a351e1f"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/1e/89/63ff0764b3d93cbe9e4e7a475e6013f345723c7fa112a09a7b8dcdf43dc7/ufonormalizer-0.3.2.zip"
    sha256 "907b32271561ae23fe1fa1235e0e05d687a10b8104f87917b57a1a57da947d5c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "makeotf", "-h"
  end
end
