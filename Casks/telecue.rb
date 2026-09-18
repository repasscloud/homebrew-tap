cask "telecue" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "186a2eae71384f82a1ebb956086e9a24c9669113a54ac64a40a28ae4a1af7d5c",
         intel: "98b1d6aa62b34c91c1d09207a92c55f92b39298ecc930627a55254456dd3e318"

  url "https://github.com/repasscloud/telecue/releases/download/v#{version}/TeleCue-#{version}-#{arch}-apple-darwin.zip"
  name "TeleCue"
  desc "Native teleprompter with an always-on-top floating prompter window"
  homepage "https://github.com/repasscloud/telecue"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :sonoma

  app "TeleCue.app"

  zap trash: [
    "~/Library/Caches/com.repasscloud.TeleCue",
    "~/Library/Preferences/com.repasscloud.TeleCue.plist",
    "~/Library/Saved Application State/com.repasscloud.TeleCue.savedState",
  ]
end
