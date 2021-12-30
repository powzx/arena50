EnemyWalkingState = Class{__includes = BaseState}

function EnemyWalkingState:init(enemy)
	self.enemy = enemy
	self.animation = Animation {
		frames = self.enemy.animations['walk']['frames'],
		interval = self.enemy.animations['walk']['interval'],
		isLoop = self.enemy.animations['walk']['isLoop']
	}
	self.enemy.currentAnimation = self.animation
end

function EnemyWalkingState:enter(params)
	self.limit = params.limit
	self.counter = 0

	if self.enemy.direction == 'left' then
		self.enemy.dx = -self.enemy.walkSpeed
	elseif self.enemy.direction == 'right' then
		self.enemy.dx = self.enemy.walkSpeed
	end
end

function EnemyWalkingState:update(dt)
	self.enemy.currentAnimation:update(dt)
	self.counter = self.counter + dt

	self.enemy.x = self.enemy.x + self.enemy.dx * dt

	if self.counter >= self.limit then
		self.enemy.stateMachine:change('idle')
	end

	if math.abs(self.enemy.x - self.enemy.map.player.x) < 50 then
		if self.enemy.hurtbox.x > self.enemy.map.player.hurtbox.x then
			self.enemy.direction = 'left'
		else
			self.enemy.direction = 'right'
		end
		self.enemy.stateMachine:change('attack')
	end

	if self.enemy.x <= -self.enemy.hurtbox.offsetX then
    	self.enemy.x = -self.enemy.hurtbox.offsetX
    end

    if self.enemy.x >= VIRTUAL_WIDTH - self.enemy.hurtbox.width - self.enemy.hurtbox.offsetX then
    	self.enemy.x = VIRTUAL_WIDTH - self.enemy.hurtbox.width - self.enemy.hurtbox.offsetX
    end
end