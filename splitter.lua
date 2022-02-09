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

    -- hovering quad:
    love.graphics.setColor(colors.red)
    love.graphics.rectangle('line',
        math.floor((self.hoveringQuadX or 0) / self.quadWidth) * self.quadWidth,
        math.floor((self.hoveringQuadY or 0) / self.quadHeight) * self.quadHeight,
        self.quadWidth,
        self.quadHeight
    )

    -- boundaries:
    love.graphics.setColor(colors.yellow)
    love.graphics.rectangle('line',
        self.x,
        self.y,
        self.quadsInX * self.quadWidth,
        self.quadsInY * self.quadHeight
    )

    love.graphics.pop()
end

function splitter:newQuad(x, y)

end

function splitter:hover(x, y, sx, sy)
    self.hoveringQuadX, self.hoveringQuadY = x, y
end

return splitter

