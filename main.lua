local AssetManager = require("src/lib/AssetManager")
local StateManager = require("src/lib/StateManager")
local MainState = require("src/states/MainState")

function love.load()
    AssetManager.preload("assets", {"parrot.png", "background.png"})
    StateManager.switch(MainState)
end

function love.update(dt)
    StateManager.update(dt)
end

function love.draw()
    StateManager.draw()
end
