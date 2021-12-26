Tile = Class{}

function Tile:init(x, y, id)
	self.x = x
	self.y = y
	self.id = id

	self.width = TILE_SIZE
	self.height = TILE_SIZE
end

function Tile:collides(target)
	return not (target.x > self.x + self.width or self.x > target.x + target.width or 
		target.y > self.y + self.height or self.y > target.y + target.height)
end

function Tile:render()
	love.graphics.draw(gTextures['tileset'], gFrames['tileset'][self.id], (self.x - 1) * TILE_SIZE, (self.y - 1) * TILE_SIZE)
end

function Tile:collidable()
	if self.id == TILE_EMPTY_ID then
		return false
	end
	
	return true
end