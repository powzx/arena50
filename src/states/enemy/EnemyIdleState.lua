EnemyIdleState = Class{__includes = BaseState}

function EnemyIdleState:init(enemy)
	self.enemy = enemy
	self.animation = Animation {
		frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
		interval = 0.1,
		isLoop = true
	}
	self.enemy.currentAnimation = self.animation
end

function EnemyIdleState:update(dt)
	self.enemy.currentAnimation:update(dt)

	if math.abs(self.enemy.x - self.enemy.map.player.x) < 50 then
		if self.enemy.hurtbox.x > self.enemy.map.player.hurtbox.x then
			self.enemy.direction = 'left'
		else
			self.enemy.direction = 'right'
		end

		self.enemy.stateMachine:change('attack')
	end

	if math.random(100) == 1 then
		self.enemy.direction = (math.random(2) == 1) and 'left' or 'right'
		self.enemy.stateMachine:change('walk', {limit = math.random(10)})
	end
end