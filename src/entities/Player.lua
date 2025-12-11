local AssetManager = require("src/lib/AssetManager")
local Math = require("src/lib/Math")

function Player(x, y)
    local self = {}
    self.x = x or 0
    self.y = y or 0
    self.speed = 100
    self.image = AssetManager.loadImage("parrot.png")
    self.dir = {x=0,y=0}

    function self:update(dt)
        self.dir.x = 0
        self.dir.y = 0

        if love.keyboard.isDown("right") then 
            self.dir.x = 1
        end

        if love.keyboard.isDown("left") then 
            self.dir.x = -1
        end

        if love.keyboard.isDown("down") then 
            self.dir.y = 1
        end
        if love.keyboard.isDown("up") then 
            self.dir.y = -1
        end

        self.dir = Math.normalize_vector(self.dir)

        self.x = self.x + self.speed * self.dir.x * dt
        self.y = self.y + self.speed * self.dir.y * dt

    end

    function self:draw()
       love.graphics.draw(self.image, self.x, self.y) 
    end

    return self
end

return Player