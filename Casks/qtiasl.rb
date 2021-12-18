cask "qtiasl" do
  version "1.0.79"
  sha256 "17a90285bf3786294914943370648edc3efd8ab6b1c51b91ff34d7e9aeac9870"

  url "https://github.com/ic005k/QtiASL/releases/download/#{version}/QtiASL_Mac.dmg"
  name "QtiASL"
  homepage "https://github.com/ic005k/QtiASL"

  depends_on macos: ">= :high_sierra"

  app "QtiASL.app"

  caveats <<~EOS
    #{token} will only run from within /Applications,
    and will request to be moved at launch.
  EOS
end
