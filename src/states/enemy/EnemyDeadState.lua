EnemyDeadState = Class{__includes = BaseState}

function EnemyDeadState:init(enemy)
	self.enemy = enemy
	self.animation = Animation {
		frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
		interval = 0.1,
		isLoop = false
	}
	self.enemy.currentAnimation = self.animation
end

function EnemyDeadState:update(dt)
	self.enemy.currentAnimation:update(dt)
end