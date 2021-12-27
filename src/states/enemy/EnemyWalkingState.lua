EnemyWalkingState = Class{__includes = BaseState}

function EnemyWalkingState:init(enemy)
	self.enemy = enemy
	self.animation = Animation {
		frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
		interval = 0.1,
		isLoop = true
	}
	self.enemy.currentAnimation = self.animation
end

function EnemyWalkingState:enter(params)
	self.limit = params.limit
	self.counter = 0

	if self.enemy.direction == 'left' then
		self.enemy.dx = -ENEMY_WALK_SPEED
	elseif self.enemy.direction == 'right' then
		self.enemy.dx = ENEMY_WALK_SPEED
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

	if self.enemy.x <= 0 then
    	self.enemy.x = 0
    end

    if self.enemy.x >= VIRTUAL_WIDTH - ENEMY_WIDTH then
    	self.enemy.x = VIRTUAL_WIDTH - ENEMY_WIDTH
    end
end