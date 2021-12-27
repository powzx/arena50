Enemy = Class{__includes = BaseState}

function Enemy:init(map)
	self.x = VIRTUAL_WIDTH - ENEMY_WIDTH
	self.y = VIRTUAL_HEIGHT / 2

	self.dx = 0
	self.dy = 0

	self.width = ENEMY_WIDTH
	self.height = ENEMY_HEIGHT

	self.hurtbox = Hurtbox(self)
	self.hitbox = Hitbox(self)

	self.stateMachine = StateMachine {
		['idle'] = function() return EnemyIdleState(self) end,
	}
	self.stateMachine:change('idle')

	self.map = map
	self.direction = 'left'
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