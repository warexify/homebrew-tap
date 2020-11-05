cask 'subgit' do
  version '3.3.10'
  sha256 'd3a1bda99bc6b791f73e14775fd5addd3401d356c68f058a96be78079faaecfc'

  url "https://subgit.com/download/subgit-#{version}.zip"
  name 'SubGit'
  homepage 'https://subgit.com/'

  binary "subgit-#{version}/bin/subgit"

  caveats do
    depends_on_java '7+'
  end
end