Map = Class {}

function Map:init(width, height, set)
	self.tiles = {}
	self.width = width
	self.height = height
	self.set = set

	self.player = Player(self)

	self.enemy = {}
	self.deadEnemy = {}
	self:spawnEnemies()

	for y = 1, self.height do
        table.insert(self.tiles, {})
    end

	for x = 1, self.width do
		for y = 1, self.height do
			if y > GROUND_LEVEL then
				table.insert(self.tiles[y], Tile(x, y, TILE_INNER_ID, self.set))
			elseif y == GROUND_LEVEL then
				table.insert(self.tiles[y], Tile(x, y, TILE_TOP_ID, self.set))
			else
				table.insert(self.tiles[y], Tile(x, y, TILE_EMPTY_ID, self.set))
			end
		end
	end
end

function Map:update(dt)
	self.player:update(dt)
	
	for k, enemy in pairs(self.enemy) do
		enemy:update(dt)
	end
end

function Map:render()
	for x = 1, self.width do
		for y = 1, self.height do
			self.tiles[y][x]:render()
		end
	end

	for k, enemy in pairs(self.enemy) do
		enemy:render(dt)
	end
	
	self.player:render()
end

function Map:pointToTile(x, y)
    if x < 0 or x > self.width * TILE_SIZE or y < 0 or y > self.height * TILE_SIZE then
        return nil
    end
    
    return self.tiles[math.floor(y / TILE_SIZE) + 1][math.floor(x / TILE_SIZE) + 1]
end

function Map:spawnEnemies()
	local numOfEnemies = math.random(1, 4)

	for i = 1, numOfEnemies do
		table.insert(self.enemy, Enemy(self, 'skeleton', ENEMY_DEFS['skeleton']))
	end
end