local Math = {}

function Math.normalize_vector(vec)
    local length = math.sqrt(vec.x * vec.x + vec.y * vec.y)
    if length > 0 then 
        vec.x = vec.x / length
        vec.y = vec.y / length
    else
        vec.x = 0
        vec.y = 0
    end

    return vec
end

return Math