-- conf.lua
function love.conf(t)
    t.title = "Game Name"
    t.version = "11.5"  -- or whatever LÖVE version
    t.window.width = 800
    t.window.height = 600
    t.console = true  -- useful for debugging on Windows
end