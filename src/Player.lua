Player = Class{}

function Player:init(map)
	self.x = 0
	self.y = -PLAYER_HEIGHT

	self.dx = 0
	self.dy = 0

	self.width = PLAYER_WIDTH
	self.height = PLAYER_HEIGHT

	self.stateMachine = StateMachine {
		['idle'] = function() return PlayerIdleState(self) end,
		['walking'] = function() return PlayerWalkingState(self) end,
		['jump'] = function() return PlayerJumpState(self) end,
		['falling'] = function() return PlayerFallingState(self) end
	}
	self.stateMachine:change('falling')

	self.map = map
	self.direction = 'right'
end

function Player:update(dt)
	self.stateMachine:update(dt)
end

function Player:render()
	love.graphics.draw(gTextures['player'], gFrames['player'][self.currentAnimation:getCurrentFrame()],
        math.floor(self.x) + PLAYER_WIDTH / 2, math.floor(self.y) + PLAYER_HEIGHT / 2, 0, 
        self.direction == 'right' and 1 or -1, 1, PLAYER_WIDTH / 2, PLAYER_HEIGHT / 2)
end

function Player:checkCollisions()
	local tileLeft = self.map:pointToTile(self.x + 1, self.y + self.height - 1)
	local tileRight = self.map:pointToTile(self.x + self.width - 1, self.y + self.height - 1)

	if (tileLeft and tileLeft:collidable()) or (tileRight and tileRight:collidable()) then
		return true
	end
	return false
end