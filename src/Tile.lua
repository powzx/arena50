Tile = Class{}

function Tile:init(x, y, id)
	self.x = x
	self.y = y
	self.id = id

	self.width = TILE_SIZE
	self.height = TILE_SIZE
end

function Tile:render()
	love.graphics.draw(gTextures['tileset'], gFrames['tileset'][self.id], (self.x - 1) * TILE_SIZE, (self.y - 1) * TILE_SIZE)
end