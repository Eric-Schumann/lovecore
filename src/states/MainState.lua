local AssetManager = require("src/lib/AssetManager")
local Player = require("src/entities/Player")
local player
local background

local MainState = {}

function MainState:enter()
    background = AssetManager.loadImage("background.png")
    player = Player(100, 100)   
end

function MainState:update(dt)
    player:update(dt)
end

function MainState:draw()
    love.graphics.draw(background, 0, 0)
    player:draw()
end

function MainState:leave()
    
end

return MainState