local Rain = require("rain")
raindrops = {}

function love.load()
    for i = 1, 150 do
        local x = love.math.random(0, love.graphics.getWidth())
        local y = love.math.random(-500, -50)
        local width = love.math.random(1, 2)
        local height = love.math.random(10, 20)
        local speed = love.math.random(300, 500)
        raindrops[i] = Rain:new(x, y, width, height, speed)
    end
end

function love.update(dt)
    for i, raindrop in ipairs(raindrops) do
        raindrop:update(dt)

        raindrop.speed = raindrop.speed + 200 * dt
        if raindrop.y - raindrop.height > love.graphics.getHeight() then
            raindrop.speed = love.math.random(300, 500);
        end
        -- Reset raindrop position if it goes below the screen
        if raindrop.y - raindrop.height > love.graphics.getHeight() then
            raindrop.y = -raindrop.height
            raindrop.x = love.math.random(0, love.graphics.getWidth())
        end
    end
end

function love.draw()
    for i, raindrop in ipairs(raindrops) do
        raindrop:draw()
    end
end