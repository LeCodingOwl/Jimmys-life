-- setting the scene. For now, there is no scene so it set to nil (null or nothing)
local sceneManager = {
    current = nil
}

function sceneManager:switch(scene)
    self.current = scene    -- this is a "pointer" that sets the scene as the active scene
    if self.current.load then   -- checks if the new scene has a load function.
        self.current:load() -- calls the scene's load method
    end
end

function sceneManager:update(dt)
    if self.current and self.current.update then    -- checks if there is a scene and if this scene has a update function
        self.current:update(dt) -- if the scene does have a update function, call its update function
    end
end

function sceneManager:draw(centerX, centerY)
    if self.current and self.current.draw then  --checks if there is a scene and if this scnee has a draw function
        self.current:draw(centerX, centerY) -- if the scene does have a draw functon, call its draw function
    end
end

function sceneManager:mousepressed(mouseScaleX, mouseScaleY, button, centerX, centerY)
    if self.current and self.current.mousepressed then  -- checks if there is a scene and if this cene has a mousepressed function
        self.current:mousepressed(mouseScaleX, mouseScaleY, button, centerX, centerY) -- if the scene does have a mousepressed function, call its mousepressed function
    end
end

return sceneManager