local colors = {}

-- Base colors
colors.black  = {0, 0, 0}
colors.white  = {1, 1, 1}
colors.gray   = {0.5, 0.5, 0.5}
colors.red    = {1, 0, 0}
colors.orange = {1, 0.47, 0}
colors.yellow = {1, 1, 0}
colors.green  = {0, 1, 0}
colors.blue   = {0, 0.47, 1}
colors.purple = {0.63, 0.2, 0.63}
colors.brown  = {0.55, 0.27, 0.07}

-- ChatGPT helped. This should make it easier to set colors shades, instead having to hand-pick the lighter/darker shades
-- Helper: lighten or darken a color
local function adjustColor(color, factor)
    local r, g, b = color[1], color[2], color[3]
    if factor < 1 then
        -- Darken: scale down towards black
        return {r * factor, g * factor, b * factor}
    else
        -- Lighten: blend towards white
        return {
            r + (1 - r) * (factor - 1),
            g + (1 - g) * (factor - 1),
            b + (1 - b) * (factor - 1)
        }
    end
end

-- Shortcut functions
function colors.dark(base)   return adjustColor(base, 0.6) end -- 40% darker
function colors.light(base)  return adjustColor(base, 1.4) end -- 40% lighter
return colors