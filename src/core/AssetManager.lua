local AssetManager = {}

local assetPath = "assets/"
local cache = {
    images={}
}

--- @param filename string Name of the file for your asset.
function AssetManager.loadImage(filename)
    local fullPath = assetPath .. filename
    if not cache.images[fullPath] then 
        local image = love.graphics.newImage(fullPath)
        if image:getWidth() == 0 or image:getHeight() == 0 then 
            error("Failed to load image: " .. fullPath .. " (file missing or corrupted)")
        end
        image:setFilter("nearest", "nearest")
        cache.images[fullPath] = image
    end
    return cache.images[fullPath]
end

--- @param root string|nil Optional override for "assets/".  The root folder where you store your assets.
--- @param list table Array of filenames (e.g., {"player.png", "background.png"})
function AssetManager.preload(root, list)
    if root then 
        assetPath = root
        if not assetPath:match("/$") then 
            assetPath = assetPath .. "/"
        end
    end
    for _, filename in ipairs(list) do
        AssetManager.loadImage(filename)
    end
end

return AssetManager