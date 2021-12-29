Enemy = Class{__includes = BaseState}

function Enemy:init(map, key, def)
	self.key = key

	self.x = math.random(0, VIRTUAL_WIDTH - def.width)
	self.y = (GROUND_LEVEL - 1) * TILE_SIZE - def.height

	self.dx = 0
	self.dy = 0

	self.width = def.width
	self.height = def.height

	self.hurtbox = Hurtbox(self, def.hurtboxOffsetX, def.hurtboxOffsetWidth)
	self.hitbox = Hitbox(self, def.hitboxOffsetXLeft, def.hitboxOffsetXRight, def.hitboxOffsetWidth)

	self.animations = def.animations

	self.stateMachine = StateMachine {
		['idle'] = function() return EnemyIdleState(self, self.animations['idle']) end,
		['hit'] = function() return EnemyHitState(self, self.animations['hit']) end,
		['dead'] = function() return EnemyDeadState(self, self.animations['dead']) end,
		['attack'] = function() return EnemyAttackState(self, self.animations['attack']) end,
		['walk'] = function() return EnemyWalkingState(self, self.animations['walk']) end
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
	--self.hurtbox:render()
	--if self.hitbox.isEffective then
	--	self.hitbox:render()
	--end
end

function Enemy:calculateRenderOffset()
	if self.stateMachine.name == 'attack' then
		self.offsetX = 2
		self.offsetY = -5
	elseif self.stateMachine.name == 'hit' then
		self.offsetX = 5
		self.offsetY = 0
	else
		self.offsetX = 0
		self.offsetY = 0
	end
end