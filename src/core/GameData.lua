local GameData = {}

local state = {
    lives = 0,
    score = 0
}

--- Examples
function GameData.addScore(number)
    state.score = state.score + (number or 0)
end

function GameData.loseLife()
    if state.lives > 0 then 
        state.lives = state.lives - 1
    end
end

function GameData.reset()
    state.lives = 0
    state.score = 0
end

function GameData.getScore()
    return state.score
end

function GameData.setScore(number)
    state.score = number or 0
end

function GameData.getLives()
    return state.lives
end

function GameData.setLives(number)
    state.lives = number or 0
end

return GameData