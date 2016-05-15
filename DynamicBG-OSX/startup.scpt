tell application "Terminal"
    do script ("nohup /System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background &")
    do script ("killall Terminal")
end tell