Enemy = Class{__includes = BaseState}

function Enemy:init(map)
	self.x = VIRTUAL_WIDTH - ENEMY_WIDTH
	self.y = (GROUND_LEVEL - 1) * TILE_SIZE - ENEMY_HEIGHT

	self.dx = 0
	self.dy = 0

	self.width = ENEMY_WIDTH
	self.height = ENEMY_HEIGHT

	self.hurtbox = Hurtbox(self, 8, -12)
	self.hitbox = Hitbox(self, -10, 24, -14)

	self.stateMachine = StateMachine {
		['idle'] = function() return EnemyIdleState(self) end,
		['hit'] = function() return EnemyHitState(self) end,
		['dead'] = function() return EnemyDeadState(self) end,
		['attack'] = function() return EnemyAttackState(self) end
	}
	self.stateMachine:change('idle')

	self.map = map
	self.direction = 'left'

	self.health = 100
	self.isDead = false
end

function Enemy:update(dt)
	self.stateMachine:update(dt)
	self.hurtbox:update(dt)
	self.hitbox:update(dt)
end

function Enemy:render()
	love.graphics.draw(gTextures['enemy-' .. self.stateMachine.name], gFrames['enemy-' .. self.stateMachine.name][self.currentAnimation:getCurrentFrame()],
        math.floor(self.x) + ENEMY_WIDTH / 2, math.floor(self.y) + ENEMY_HEIGHT / 2, 0, 
        self.direction == 'right' and 1 or -1, 1, ENEMY_WIDTH / 2, ENEMY_HEIGHT / 2)
	self.hurtbox:render()
	if self.hitbox.isEffective then
		self.hitbox:render()
	end
end