cask "subgit" do
  version "3.3.11"
  sha256 "96d4e99973c22064e6543c4a73aa1e94c1334165d16c87f43444b346e81a5e8d"

  url "https://subgit.com/files/subgit-#{version}.zip"
  name "SubGit"
  homepage "https://subgit.com/"

  binary "subgit-#{version}/bin/subgit"

  caveats do
    depends_on_java "7+"
  end
end
