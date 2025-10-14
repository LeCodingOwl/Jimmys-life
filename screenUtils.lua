local config = require "config"
local screenUtils = {}

-- Get the center of the screen
function screenUtils.GetCenter()
    local centerX = config.baseWidth / 2
    local centerY = config.baseHeight / 2
    return centerX, centerY
end

function screenUtils.getRescale()
    local currentWidth, currentHeight = love.graphics.getDimensions()
    local scaleX = currentWidth / config.baseWidth
    local scaleY = currentHeight / config.baseHeight
    return scaleX, scaleY
end

return screenUtils