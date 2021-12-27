EnemyHitState = Class{__includes = BaseState}

function EnemyHitState:init(enemy)
	self.enemy = enemy
	self.animation = Animation {
		frames = {1, 2, 3, 4, 5, 6, 7, 8},
		interval = 0.1,
		isLoop = false
	}
	self.enemy.currentAnimation = self.animation
end

function EnemyHitState:update(dt)
	self.enemy.currentAnimation:update(dt)
	if self.animation.isDone then
		self.enemy.stateMachine:change('idle')
	end

	if self.enemy.health <= 0 then
		self.enemy.map.player.health = self.enemy.map.player.health + 2
		self.enemy.stateMachine:change('dead')
	end
end