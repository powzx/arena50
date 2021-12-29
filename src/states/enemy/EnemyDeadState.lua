EnemyDeadState = Class{__includes = BaseState}

function EnemyDeadState:init(enemy, animationInfo)
	self.enemy = enemy
	self.animation = Animation {
		frames = animationInfo['frames'],
		interval = animationInfo['interval'],
		isLoop = animationInfo['isLoop']
	}
	self.enemy.currentAnimation = self.animation

	self.enemy.isDead = true
end

function EnemyDeadState:update(dt)
	self.enemy.currentAnimation:update(dt)
end