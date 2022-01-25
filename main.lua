local cell = require("cell")

local board = {}

local ww, wh = love.graphics.getDimensions()

local function generateCells()
	local cellSize = 100
	local startX = ww / 2 - cellSize * 3 / 2
	local x = 0
	local y = wh / 2 - cellSize * 3 / 2
	for i = 1, 3 do
		board[i] = {}
		for j = 1, 3 do
			x = startX + cellSize * (j - 1)
			local newCell = cell.new({x = x, y = y, width = cellSize, height = cellSize, id = {i, j}})
			board[i][j] = newCell
		end
		y = y + cellSize
	end
end

function love.load()
	generateCells()
end

function love.draw()
	for i = 1, #board do
		for j = 1, #board[i] do
			board[i][j]:draw()
		end
	end
end

function love.mousepressed(x,y,button,istouch,presses)
	for i = 1, #board do
		for j = 1, #board[i] do
			board[i][j]:mousepressed(x,y,button,istouch,presses)
		end
	end
end

function love.mousereleased(x,y,button,istouch,presses)
	for i = 1, #board do
		for j = 1, #board[i] do
			board[i][j]:mousereleased(x,y,button,istouch,presses)
		end
	end
end

function love.update(dt)
	for i = 1, #board do
		for j = 1, #board[i] do
			board[i][j]:update(dt)
		end
	end
end