cask 'fastdmg' do
  version :latest
  sha256 :no_check

  url 'https://sveinbjorn.org/files/software/FastDMG.zip'
  name 'FastDMG'
  homepage 'https://sveinbjorn.org/fastdmg/'

  app 'FastDMG.app'
end
