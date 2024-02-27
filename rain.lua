Rain = {}

function Rain:new(x, y, width, height, speed)
    local rain = {
        x = x,
        y = y,
        width = width,
        height = height,
        speed = speed
    }
    setmetatable(rain, self)
    self.__index = self
    return rain
end

function Rain:update(dt)
    self.y = self.y + self.speed * dt
end

function Rain:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    -- love.graphics.print("speed" .. self.speed, self.x, self.y - 20)
end

return Rain