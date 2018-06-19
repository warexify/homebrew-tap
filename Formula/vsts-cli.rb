class VstsCli < Formula
  include Language::Python::Virtualenv

  desc "Manage and work with VSTS/TFS resources from the command-line"
  homepage "https://docs.microsoft.com/en-us/cli/vsts"
  url "https://vstscli.azurewebsites.net/vsts-cli/vsts-cli-0.1.1.dev6378968.tar.gz"
  version "0.1.1.dev6378968"
  sha256 "8c9b2693d24b495d842cbb21a1171e3476be830b883728d9bb243238871273b7"

  depends_on "python"

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/3c/21/9741e5e5e63245a8cdafb32ffc738bff6e7ef6253b65953e77933e56ce88/argcomplete-1.9.4.tar.gz"
    sha256 "06c8a54ffaa6bfc9006314498742ec8843601206a3b94212f82657673662ecf1"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/4d/9c/46e950a6f4d6b4be571ddcae21e7bc846fcbb88f1de3eff0f6dd0a6be55d/certifi-2018.4.16.tar.gz"
    sha256 "13e698f54293db9f89122b0581843a782ad0934a4fe0172d2a980ba77fc61bb7"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/e6/76/257b53926889e2835355d74fec73d82662100135293e17d382e2b74d1669/colorama-0.3.9.tar.gz"
    sha256 "48eb22f4f8461b1df5734a074b57042430fb06e1d61bd1e11b078c0fe6d7a1f1"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz"
    sha256 "2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f"
  end

  resource "isodate" do
    url "https://files.pythonhosted.org/packages/b1/80/fb8c13a4cd38eb5021dc3741a9e588e4d1de88d895c1910c6fc8a08b7a70/isodate-0.6.0.tar.gz"
    sha256 "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz"
    sha256 "6a81d4c9aa62caf061cb517b4d9ad1dd300374cd4706997aff9cd6aedd61fc64"
  end

  resource "configparser" do
    url "https://files.pythonhosted.org/packages/7c/69/c2ce7e91c89dc073eb1aa74c0621c3eefbffe8216b3f9af9d3885265c01c/configparser-3.5.0.tar.gz"
    sha256 "5308b47021bc2340965c371f0f058cc6971a04502638d4244225c49d80db273a"
  end

  resource "entrypoints" do
    url "https://files.pythonhosted.org/packages/27/e8/607697e6ab8a961fc0b141a97ea4ce72cd9c9e264adeb0669f6d194aa626/entrypoints-0.2.3.tar.gz"
    sha256 "d2d587dde06f99545fb13a383d2cd336a8ff1f359c5839ce3a64c917d10c029f"
  end

  resource "keyring" do
    url "https://files.pythonhosted.org/packages/d8/07/e862b57168e088f3ba880fba2471f05f78c19e75b1632be0143d116e7fa3/keyring-12.2.1.tar.gz"
    sha256 "4498eaa2e32fc69a8b36749116b670c379d36a1a9ad4ab107df1e19c8a120ffe"
  end

  resource "knack" do
    url "https://files.pythonhosted.org/packages/87/9d/1ac7e61b373e94ae96c28fc8e80976c24ce2f5d11c5d22330eed0a874dc9/knack-0.3.3.tar.gz"
    sha256 "dd2d3c4756975d6bdbbc65a25c067245350eec81547dac93a5c96a80a9f949f0"
  end

  resource "msrest" do
    url "https://files.pythonhosted.org/packages/9b/49/ed5c9ea20f83707f4f67fbc664082d6d9a356b44f5f64ec5a5c7e0fdb365/msrest-0.4.29.tar.gz"
    sha256 "ce0a558173b7c7bff87dc66e24331382c81a89367ea52c52bbb934de6064cb45"
  end

  resource "oauthlib" do
    url "https://files.pythonhosted.org/packages/df/5f/3f4aae7b28db87ddef18afed3b71921e531ca288dc604eb981e9ec9f8853/oauthlib-2.1.0.tar.gz"
    sha256 "ac35665a61c1685c56336bda97d5eefa246f1202618a1d6f34fccb1bdd404162"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"
    sha256 "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz"
    sha256 "e27001de32f627c22380a688bcc43ce83504a7bc5da472209b4c70f02829f0b8"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"
    sha256 "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz"
    sha256 "9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e"
  end

  resource "requests-oauthlib" do
    url "https://files.pythonhosted.org/packages/80/14/ad120c720f86c547ba8988010d5186102030591f71f7099f23921ca47fe5/requests-oauthlib-0.8.0.tar.gz"
    sha256 "883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/12/c2/11d6845db5edf1295bc08b2f488cf5937806586afe42936c3f34c097ebdc/tabulate-0.8.2.tar.gz"
    sha256 "e4ca13f26d0a6be2a2915428dc21e732f1e44dad7f76d7030b2ef1ec251cf7f2"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz"
    sha256 "cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"
  end

  resource "vsts" do
    url "https://vstscli.azurewebsites.net/vsts/vsts-0.1.10.dev6391844.tar.gz"
    sha256 "8a6a1b37f3f773a5a7dabbb0ea19d1632bf98b8f8c2761c17932a8ba935db56c"
  end

  resource "vsts-cli-build" do
    url "https://vstscli.azurewebsites.net/vsts-cli-build/vsts-cli-build-0.1.1.dev6378968.tar.gz"
    sha256 "c595d29f651a38048bec8ee267178e5c859f4e8b10ea05c85cc74ce60d694b89"
  end

  resource "vsts-cli-build-common" do
    url "https://vstscli.azurewebsites.net/vsts-cli-build-common/vsts-cli-build-common-0.1.1.dev6378968.tar.gz"
    sha256 "7253032e40b1eeb9fe08ca498a7423519973f6ecb06d0749156d9232dda03044"
  end

  resource "vsts-cli-code" do
    url "https://vstscli.azurewebsites.net/vsts-cli-code/vsts-cli-code-0.1.1.dev6378968.tar.gz"
    sha256 "65270f21f1bb7c024a3276e39135e29807d8af8cb101a74b37ebf7753303043b"
  end

  resource "vsts-cli-code-common" do
    url "https://vstscli.azurewebsites.net/vsts-cli-code-common/vsts-cli-code-common-0.1.1.dev6378968.tar.gz"
    sha256 "f5241f167cda4d7c8d98f232772bbfece67dd50e3a8c3e6f34c24bb64b657b20"
  end

  resource "vsts-cli-common" do
    url "https://vstscli.azurewebsites.net/vsts-cli-common/vsts-cli-common-0.1.1.dev6378968.tar.gz"
    sha256 "140f3bd6f555f050cab3c8366f44347261a07843d3c9bb9be5523a7c547527b3"
  end

  resource "vsts-cli-team" do
    url "https://vstscli.azurewebsites.net/vsts-cli-team/vsts-cli-team-0.1.1.dev6378968.tar.gz"
    sha256 "cae60f380cbee7ebb834687ea2b7da44489b95dc4f05d8bcd42dc99e0fc9867c"
  end

  resource "vsts-cli-team-common" do
    url "https://vstscli.azurewebsites.net/vsts-cli-team-common/vsts-cli-team-common-0.1.1.dev6378968.tar.gz"
    sha256 "83562c5e8c427d04e2524563a6829909863ead131435f8a16b773dd17668ada0"
  end

  resource "vsts-cli-work" do
    url "https://vstscli.azurewebsites.net/vsts-cli-work/vsts-cli-work-0.1.1.dev6378968.tar.gz"
    sha256 "14dbd4e9148514b820f861ca52cabeb1935c190bd34fa0c10ce4c138e8aee681"
  end

  resource "vsts-cli-work-common" do
    url "https://vstscli.azurewebsites.net/vsts-cli-work-common/vsts-cli-work-common-0.1.1.dev6378968.tar.gz"
    sha256 "a0b51c323b03c557dacc5e624c584c0aaa5d09b68baad5c377bd7bb16b3aa473"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/vsts", "configure", "--help"
    output = shell_output("#{bin}/vsts logout 2>&1", 1)
    assert_equal "ERROR: The credential was not found", output.chomp
    output = shell_output("#{bin}/vsts work 2>&1", 2)
    assert_match "vsts work: error: the following arguments are required", output
  end
end
