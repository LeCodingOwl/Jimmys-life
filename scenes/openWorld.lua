local anim8 = require("libraries.anim8")
local sti = require("libraries.sti")

local openWorld = {}

local player = {
    x = 0,
    y = 0,
    speed = 2,
    width = 50,
    height = 50
}
player.facing = {x = 0, y = 1}  --initially facing down
player.spriteSheet = love.graphics.newImage("sprites/playerSheet.png")
player.grid = anim8.newGrid(32, 64, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

player.animation = {}
player.animation.idleDown = anim8.newAnimation(player.grid('19-24', 2), 0.2)
player.animation.idleLeft = anim8.newAnimation(player.grid('13-18', 2), 0.2)
player.animation.idleUp = anim8.newAnimation(player.grid('7-12', 2), 0.2)
player.animation.idleRight = anim8.newAnimation(player.grid('1-6', 2), 0.2)

player.animation.down = anim8.newAnimation(player.grid('19-24', 3), 0.2)
player.animation.left = anim8.newAnimation(player.grid('13-18', 3), 0.2)
player.animation.up = anim8.newAnimation(player.grid('7-12', 3), 0.2)
player.animation.right = anim8.newAnimation(player.grid('1-6', 3), 0.2)

player.anim = player.animation.down

local gameMap = sti("maps/testMap.lua")

function openWorld:load()

end

function openWorld:update(dt)
    local playerMoving = false

    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        player.facing.x = -1
        player.facing.y = 0
        player.x = player.x - player.speed
        player.anim = player.animation.left
        playerMoving = true
    end
    
    if love.keyboard.isDown("d") or love.keyboard.isDown("right")then
        player.facing.x = 1
        player.facing.y = 0
        player.x = player.x + player.speed
        player.anim = player.animation.right
        playerMoving = true
    end

    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        player.facing.x = 0
        player.facing.y = -1
        player.y = player.y - player.speed
        player.anim = player.animation.up
        playerMoving = true
    end

    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        player.facing.x = 0
        player.facing.y = 1
        player.y = player.y + player.speed
        player.anim = player.animation.down
        playerMoving = true
    end
    
    if not playerMoving then
        if player.facing.y < 0 then
            --facing up
            player.anim = player.animation.idleUp
        elseif player.facing.y > 0 then
            -- facing down
            player.anim = player.animation.idleDown
        elseif player.facing.x < 0 then
            -- facing left
            player.anim = player.animation.idleLeft
        elseif player.facing.x > 0 then
            -- facing right
            player.anim = player.animation.idleRight
        end  
    end

    player.anim:update(dt)
end

function openWorld:draw(centerX, centerY)
    gameMap:draw()
    player.anim:draw(player.spriteSheet, player.x + (centerX - (player.width / 2)), player.y + (centerY - (player.height / 2)), nil)
end

return openWorld