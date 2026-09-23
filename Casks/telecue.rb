cask "telecue" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "e217954822a52e2207dbce6aca28bc43fa70ac66879a01b587338220d3d22402",
         intel: "bc93c7128886e557e33a8196c55acff9ba10e616724c75bc1bbf08aaefc7eb0b"

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
