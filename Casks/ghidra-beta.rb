cask "ghidra-beta" do
  version "10.0-BETA_PUBLIC,20210521"
  sha256 "f549dfccd0f106f9befb0b5afb7f2f86050356631b29bc9dd15d7f0333acbc7e"

  url "https://www.ghidra-sre.org/ghidra_#{version.before_comma}_#{version.after_comma}.zip"
  name "Ghidra"
  homepage "https://www.ghidra-sre.org/"

  conflicts_with cask: "ghidra"

  binary "ghidra_#{version.before_comma}/ghidraRun"

  zap trash: "~/.ghidra"

  caveats do
    depends_on_java "11+"
  end
end
