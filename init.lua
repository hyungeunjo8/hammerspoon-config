hs.hotkey.bind(
    {"cmd", "alt"},
    "Up",
    function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()
        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
        win:setFrame(f)
    end
)

hs.hotkey.bind(
    {"cmd", "alt"},
    "Left",
    function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        if (f.x == 0 and f.y == max.y and f.w == max.w / 2) then
            local win = hs.window.focusedWindow()
            local nextScreen = win:screen():next()
            win:moveToScreen(nextScreen, 0)
        else
            f.x = 0
            f.y = max.y
            f.w = max.w / 2
            f.h = max.h
            win:setFrame(f)
        end
    end
)

hs.hotkey.bind(
    {"cmd", "alt"},
    "Right",
    function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        if (f.x == max.w / 2 and f.y == max.y and f.w == max.w / 2) then
            local win = hs.window.focusedWindow()
            local nextScreen = win:screen():next()
            win:moveToScreen(nextScreen, 0)
        else
            f.x = max.w / 2
            f.y = max.y
            f.w = max.w / 2
            f.h = max.h
            win:setFrame(f)
        end
    end
)

-- 현재 finder 위치에서 terminal 실행
-- hs.hotkey.bind(
--     {"cmd", "shift"},
--     "E",
--     function()
--         hs.osascript.applescript(
--             [[
--         tell application "Finder"
--             set myWin to window 1
--             set thePath to (quoted form of POSIX path of (target of myWin as alias))
--             tell application "Terminal"
--                 activate
--                 tell window 1
--                     do script "cd " & thePath
--                 end tell
--             end tell
--         end tell
--    ]]
--         )
--     end
-- )

-- 현재 finder 위치에서 iterm 실행
-- hs.hotkey.bind(
--     {"cmd", "shift"},
--     "R",
--     function()
--         hs.osascript.applescript(
--             [[
--         tell application "Finder"
--             set myWin to window 1
--             set thePath to (quoted form of POSIX path of (target of myWin as alias))
--             tell application "iTerm2"
--                 set newWindow to (create window with default profile)
--                 tell current session of newWindow
--                     write text "cd " & thePath
--                 end tell
--             end tell
--         end tell
--    ]]
--         )
--     end
-- )
