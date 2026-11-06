cask "breakbar" do
  version "0.1.2"
  sha256 "c90b8772b8a1fc27087df2e04eee82ab6f5d38f66cab59ca9b8c3412816d3857"

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
