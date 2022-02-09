local splitter = {
    quadWidth = 18,
    quadHeight = 18,
    quadsInX = 18,
    quadsInY = 10
}
splitter.__index = splitter

local colors = require 'colors'

function splitter.new(data)
    local sp = {}

    sp.x = data.x
    sp.y = data.y

    return setmetatable(sp, splitter)
end

function splitter:draw()
    love.graphics.push('all')

    
    -- boundaries:
    love.graphics.setColor(colors.yellow)
    love.graphics.rectangle('line',
    self.x,
    self.y,
    self.quadsInX * self.quadWidth,
    self.quadsInY * self.quadHeight
)
    -- hovering quad:
    love.graphics.setColor(colors.red)
    love.graphics.rectangle('line',
        self.x + self.hoveringQuadX * self.quadWidth,
        self.y + self.hoveringQuadY * self.quadHeight,
        self.quadWidth,
        self.quadHeight
    )

    love.graphics.pop()
end

function splitter:newQuad(x, y)

end

function splitter:hover(x, y, sx, sy)
    x = x / sx
    y = y / sy

    self.hoveringQuadX = math.floor((x - self.x) / self.quadWidth)
    self.hoveringQuadY = math.floor((y - self.y) / self.quadHeight)
end

return splitter

