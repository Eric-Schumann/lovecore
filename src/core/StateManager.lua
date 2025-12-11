local StateManager = {}
local currentState = nil

--- @param to table The new state/scene to switch to.
--- The table should implement any of the following optional methods:
---   - enter(data)     Called when the state becomes active (optional data passed from switch)
---   - leave()        Called when the state is left
---   - update(dt)     Called every frame with delta time
---   - draw()         Called every frame to render the state
--- @param data? table Data that you wish to pass to the new state/scene.
function StateManager.switch(to, data)
    if currentState and currentState.leave then 
        currentState:leave()
    end
    currentState = to
    if currentState and currentState.enter then 
        currentState:enter(data)
    end
end

--- @param dt number Delta Time or time that has passed since last frame.
--- This will be passed in by love.load and should be passed here.
function StateManager.update(dt)
    if currentState and currentState.update then 
        currentState:update(dt)
    end
end

function StateManager.draw()
    if currentState and currentState.draw then 
        currentState:draw()
    end
end

return StateManager