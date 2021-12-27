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
end