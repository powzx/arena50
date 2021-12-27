Tile = Class{}

function Tile:init(x, y, id)
	self.x = x
	self.y = y
	self.id = id

	self.width = TILE_SIZE
	self.height = TILE_SIZE

	self.coordinateX = (self.x - 1) * TILE_SIZE
	self.coordinateY = (self.y - 1) * TILE_SIZE
end

function Tile:render()
	love.graphics.draw(gTextures['tileset'], gFrames['tileset'][self.id], self.coordinateX, self.coordinateY)
end

function Tile:collides(target)
	return self:collidable() and not (target.x > self.coordinateX + self.width or self.coordinateX > target.x + target.width or 
		target.y > self.coordinateY + self.height or self.coordinateY > target.y + target.height)
end

function Tile:sideCollides(target)
	return self:collidable() and (self.coordinateX > target.x and self.coordinateX < target.x + target.width) and 
		((self.coordinateY < target.y and target.y < self.coordinateY + TILE_SIZE) or 
		(self.coordinateY < target.y + target.height and target.height + target.y < self.coordinateY + TILE_SIZE))
end

function Tile:collidable()
	if self.id == TILE_EMPTY_ID then
		return false
	end
	
	return true
end