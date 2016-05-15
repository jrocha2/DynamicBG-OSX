tell application "System Events"
    set plist to name of every process
    if "ScreenSaverEngine" is in plist then
        set pid to unix id of process "ScreenSaverEngine"
        do shell script "kill -KILL " & pid
    end if
end tell