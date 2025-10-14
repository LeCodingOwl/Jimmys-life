local config = require("config")
local sceneManager = require("sceneManager")
local screenUtils  = require("screenUtils")

function love.load()
    -- setting the window settings
    love.window.setMode(config.baseWidth, config.baseHeight, {resizable = config.resizable, fullscreen = config.fullscreen})
    sceneManager:switch(require("scenes.openWorld"))
    love.graphics.setDefaultFilter("nearest", "nearest")
end

function love.update(dt)
    --running updates in sceneManager
    sceneManager:update(dt)
end

function love.draw()
    local scaleX, scaleY = screenUtils.getRescale()
    love.graphics.scale(scaleX, scaleY)

    local centerX, centerY = screenUtils.GetCenter()
    sceneManager:draw(centerX, centerY)

end