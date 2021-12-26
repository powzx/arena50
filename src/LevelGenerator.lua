LevelGenerator = Class{}

function LevelGenerator.generate(width, height)
	local entities = {}
	local objects = {}
	local tiles = {}

	local width = width
	local height = height

	for y = 1, height do
        table.insert(tiles, {})
    end

	for x = 1, width do
		for y = 1, height do
			if y >= 6 then
				table.insert(tiles[y], Tile(x, y, 21))
			else
				table.insert(tiles[y], Tile(x, y, 1))
			end
		end
	end

	local map = TileMap(width, height)
    map.tiles = tiles

	return GameLevel(entities, objects, map)
end