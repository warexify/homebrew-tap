class Aosd < Formula
  desc "Apple Open Source Downloader"
  homepage "https://github.com/warexify/aosd"
  url "https://github.com/warexify/aosd/archive/v1.1.3.tar.gz"
  sha256 "078fc2239b6f55e44904136f43ff1851f1aa694d592c12e9f675d9b8858a4bb1"
  head "https://github.com/warexify/aosd.git"

  bottle :unneeded

  depends_on "python@2"

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
end
