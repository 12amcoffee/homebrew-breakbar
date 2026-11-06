cask "breakbar" do
  version "0.1.1"
  sha256 "8b937c518d927bae33f976d0162b9a0b48c9cf8f94538903d29d18cd77228674"

  url "https://github.com/12amcoffee/BreakBar/releases/download/v#{version}/BreakBar-#{version}.zip"
  name "BreakBar"
  desc "Menu bar Pomodoro timer with a Rest window"
  homepage "https://github.com/12amcoffee/BreakBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "BreakBar.app"

  # BreakBar is not notarised by Apple. Removing the quarantine flag lets it open without the
  # "unidentified developer" warning. Delete this block if you would rather keep the warning.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/BreakBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/BreakBar",
    "~/Library/Containers/com.12amcoffee.BreakBar",
    "~/Library/Preferences/com.12amcoffee.BreakBar.plist",
  ]
end
