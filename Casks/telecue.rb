cask "telecue" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "1620436dc55f5b99694f3a16b541a89c4d618f25aba329ed33f89f1582edb10d",
         intel: "05d1ecc925728234767c61c2dbb3b7370739ac75f708586c72c2053e3e02f15c"

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
