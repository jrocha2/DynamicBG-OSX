tell application "System Preferences"
    activate
    set current pane to pane id "com.apple.preference.desktopscreeneffect"
    reveal anchor "ScreenSaverPref" of current pane
end tell