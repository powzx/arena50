EnemyAttackState = Class{__includes = BaseState}

function EnemyAttackState:init(enemy, animationInfo)
	self.enemy = enemy
	self.animation = Animation {
		frames = animationInfo['frames'],
		interval = animationInfo['interval'],
		isLoop = animationInfo['isLoop']
	}
	self.enemy.currentAnimation = self.animation

	self.enemy.hitbox.isEffective = true
end

function EnemyAttackState:update(dt)
	self.enemy.currentAnimation:update(dt)

	if self.enemy.currentAnimation.currentFrame == 8 and self.enemy.hitbox:collides(self.enemy.map.player.hurtbox) then
		self.enemy.hitbox.isEffective = false
		self.enemy.map.player.health = self.enemy.map.player.health - 1
	end

	if self.animation.isDone then
		self.enemy.stateMachine:change('idle')
	end
end