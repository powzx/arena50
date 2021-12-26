Map = Class {}

function Map:init(width, height)
	self.tiles = {}
	self.width = width
	self.height = height

	for y = 1, self.height do
        table.insert(self.tiles, {})
    end

	for x = 1, self.width do
		for y = 1, self.height do
			if y > GROUND_LEVEL then
				table.insert(self.tiles[y], Tile(x, y, TILE_INNER_ID))
			elseif y == GROUND_LEVEL then
				table.insert(self.tiles[y], Tile(x, y, TILE_TOP_ID))
			else
				table.insert(self.tiles[y], Tile(x, y, TILE_EMPTY_ID))
			end
		end
	end
end

function Map:update(dt)
end

function Map:render()
	for x = 1, self.width do
		for y = 1, self.height do
			self.tiles[y][x]:render()
		end
	end
end

function Map:pointToTile(x, y)
    if x < 0 or x > self.width * TILE_SIZE or y < 0 or y > self.height * TILE_SIZE then
        return nil
    end
    
    return self.tiles[math.floor(y / TILE_SIZE) + 1][math.floor(x / TILE_SIZE) + 1]
end