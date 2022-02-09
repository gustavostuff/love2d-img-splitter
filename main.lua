canvas = {
  img = love.graphics.newImage('test2.jpg'),
  x = 0,
  y = 0
}

local constants = require 'constants'
local sp = require 'splitter'
local colors = require 'colors'

function love.load()
  loveCanvas = love.graphics.newCanvas(constants.CANVAS_W, constants.CANVAS_H)
  loveCanvas:setFilter(constants.CANVAS_FILTER_NEAREST, constants.CANVAS_FILTER_NEAREST)
  loveCanvasSX = love.graphics.getWidth() / loveCanvas:getWidth()
  loveCanvasSY = love.graphics.getHeight() / loveCanvas:getHeight()

	quadsFrame = sp.new({
    x = canvas.x,
    y = canvas.y
  })
end

function love.update(dt)

end

function love.draw()
  love.graphics.setCanvas(loveCanvas)

  -- background
  love.graphics.setColor(colors.black)
  love.graphics.rectangle('fill', 0, 0, loveCanvas:getWidth(), loveCanvas:getHeight())

  love.graphics.setColor(colors.white)
	love.graphics.draw(canvas.img, canvas.x, canvas.y)
  
  -- debug lines
  love.graphics.setColor(colors.orange)
  love.graphics.rectangle('line',
    canvas.x,
    canvas.y,
    canvas.img:getWidth(),
    canvas.img:getHeight()
  )

  -- frames
  quadsFrame:draw()

  -- end of drawing on canvas
  love.graphics.setCanvas()
  
  love.graphics.setColor(colors.white)
  love.graphics.draw(loveCanvas, 0, 0, 0, loveCanvasSX, loveCanvasSY)
end

function love.mousemoved(x, y)
  x = x / loveCanvasSX
  y = y / loveCanvasSY

  quadsFrame:hover(x, y, loveCanvasSX, loveCanvasSY)
end

function love.keypressed(k)
  if k == 'escape' then
      love.event.quit()
  end
end