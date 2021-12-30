Enemy = Class{__includes = BaseState}

function Enemy:init(map, key, def)
	self.key = key

	self.x = math.random(0, VIRTUAL_WIDTH - def.width)
	self.y = (GROUND_LEVEL - 1) * TILE_SIZE - def.height

	self.dx = 0
	self.dy = 0

	self.width = def.width
	self.height = def.height

	self.hurtbox = Hurtbox(self, def.hurtboxOffsetX, def.hurtboxOffsetY, def.hurtboxOffsetWidth, def.hurtboxOffsetHeight)
	self.hitbox = Hitbox(self, def.hitboxOffsetXLeft, def.hitboxOffsetXRight, def.hitboxOffsetY, def.hitboxOffsetWidth, def.hitboxOffsetHeight)

	self.renderOffsets = def.renderOffsets
	self.animations = def.animations
	self.walkSpeed = def.walkSpeed
	self.strikeFrame = def.strikeFrame

	self.stateMachine = StateMachine {
		['idle'] = function() return EnemyIdleState(self) end,
		['hit'] = function() return EnemyHitState(self) end,
		['dead'] = function() return EnemyDeadState(self) end,
		['attack'] = function() return EnemyAttackState(self) end,
		['walk'] = function() return EnemyWalkingState(self) end
	}
	self.stateMachine:change('idle')

	self.map = map
	self.direction = 'left'

	self.health = 6
	self.isDead = false
end

function Enemy:update(dt)
	self.stateMachine:update(dt)
	self.hurtbox:update(dt)
	self.hitbox:update(dt)
end

function Enemy:render()
	self:calculateRenderOffset()
	love.graphics.draw(gTextures[self.key .. '-' .. self.stateMachine.name], gFrames[self.key .. '-' .. self.stateMachine.name][self.currentAnimation:getCurrentFrame()],
        math.floor(self.x) + self.width / 2 + self.offsetX, math.floor(self.y) + self.height / 2 + self.offsetY, 0, 
        self.direction == 'right' and 1 or -1, 1, self.width / 2, self.height / 2)

	-- debug mode
	self.hurtbox:render()
	if self.hitbox.isEffective then
		self.hitbox:render()
	end
end

function Enemy:calculateRenderOffset()
	if self.stateMachine.name == 'attack' then
		self.offsetX = self.renderOffsets['attack']['x']
		self.offsetY = self.renderOffsets['attack']['y']
	elseif self.stateMachine.name == 'hit' then
		self.offsetX = self.renderOffsets['hit']['x']
		self.offsetY = self.renderOffsets['hit']['y']
	elseif self.stateMachine.name == 'dead' then
		self.offsetX = self.renderOffsets['dead']['x']
		self.offsetY = self.renderOffsets['dead']['y']
	elseif self.stateMachine.name == 'idle' then
		self.offsetX = self.renderOffsets['idle']['x']
		self.offsetY = self.renderOffsets['idle']['y']
	elseif self.stateMachine.name == 'walk' then
		self.offsetX = self.renderOffsets['walk']['x']
		self.offsetY = self.renderOffsets['walk']['y']
	end
end