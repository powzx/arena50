Player = Class{}

function Player:init(map, def, weapon)
	self.x = 0
	self.y = -PLAYER_HEIGHT

	self.dx = 0
	self.dy = 0

	self.width = PLAYER_WIDTH
	self.height = PLAYER_HEIGHT

	self.hurtbox = Hurtbox(self, PLAYER_HURTBOX_OFFSET_X, PLAYER_HURTBOX_OFFSET_Y, PLAYER_HURTBOX_OFFSET_WIDTH, PLAYER_HURTBOX_OFFSET_HEIGHT)
	self.hitbox = Hitbox(self, PLAYER_HITBOX_OFFSET_X_LEFT, PLAYER_HITBOX_OFFSET_X_RIGHT, PLAYER_HITBOX_OFFSET_Y, PLAYER_HITBOX_OFFSET_WIDTH, PLAYER_HITBOX_OFFSET_HEIGHT)

	self.stateMachine = StateMachine {
		['idle'] = function() return PlayerIdleState(self) end,
		['walking'] = function() return PlayerWalkingState(self) end,
		['jump'] = function() return PlayerJumpState(self) end,
		['falling'] = function() return PlayerFallingState(self) end,
		['attack']= function() return PlayerAttackState(self) end
	}
	self.stateMachine:change('falling')

	self.map = map
	self.direction = 'right'

	self.health = def.maxHealth
	self.maxHealth = def.maxHealth
	self.damage = weapon.damage
	self.kills = 0
end

function Player:update(dt)
	self.stateMachine:update(dt)
	self.hurtbox:update(dt)
	self.hitbox:update(dt)
end

function Player:render()
	love.graphics.draw(gTextures['player'], gFrames['player'][self.currentAnimation:getCurrentFrame()],
        math.floor(self.x) + PLAYER_WIDTH / 2, math.floor(self.y) + PLAYER_HEIGHT / 2, 0, 
        self.direction == 'right' and 1 or -1, 1, PLAYER_WIDTH / 2, PLAYER_HEIGHT / 2)

	-- debug mode
	self.hurtbox:render()
	if self.hitbox.isEffective then
		self.hitbox:render()
	end
end

function Player:checkTileBeneath()
	local tileBottomLeft = self.map:pointToTile(self.hurtbox.x + 1, self.hurtbox.y + self.hurtbox.height - 1)
	local tileBottomRight = self.map:pointToTile(self.hurtbox.x + self.hurtbox.width - 1, self.hurtbox.y + self.hurtbox.height - 1)

	if (tileBottomLeft and tileBottomLeft:collidable()) or (tileBottomRight and tileBottomRight:collidable()) then
		return tileBottomLeft.coordinateY or tileBottomRight.coordinateY
	end
end

function Player:checkTileSide()
	for x = 1, self.map.width do
		for y = 1, self.map.height do
			if self.map.tiles[y][x]:collides(self.hurtbox) then
				return (x - 1) * TILE_SIZE
			end
		end
	end
end