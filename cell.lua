local Cell = {}
Cell.__index = Cell

function Cell.new(settings)
	local instance = setmetatable({}, Cell)
	instance.x = settings.x or 0
	instance.y = settings.y or 0
	instance.width = settings.width or 50
	instance.height = settings.height or 50
	instance.id = settings.id
	instance.active = false
	return instance
end

function Cell:containsPoint(x, y)
	return x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height
end

function Cell:mousepressed(x,y,button,istouch,presses)
	if self:containsPoint(x,y) then
		self.active = true
		print("I clicked row ".. self.id[1].." and cell "..self.id[2])
		
	end
end

function Cell:mousereleased(x,y,button,istouch,presses)
	self.active = false
end

function Cell:update(dt)
	
end

function Cell:draw()
	if self.active then
		love.graphics.print("I clicked row ".. self.id[1].." and cell "..self.id[2], 10, 10)
		love.graphics.setColor(1,1,1)
		love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
		love.graphics.setColor(1,0,0)
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	else
		love.graphics.setColor(1,1,1)
		love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	end
end

return Cell