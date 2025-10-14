
local openWorld = {}

local player = {
    x = 0,
    y = 0,
    speed = 5,
    width = 50,
    height = 50
}

function openWorld:load()

end

function openWorld:update(dt)
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    end
    
    if love.keyboard.isDown("d") or love.keyboard.isDown("right")then
        player.x = player.x + player.speed
    end

    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end

    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end
end

function openWorld:draw(centerX, centerY)
    love.graphics.rectangle("fill", player.x + (centerX - (player.width / 2)), player.y + (centerY - (player.height / 2)), player.width, player.height)
end

return openWorld