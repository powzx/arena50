EnemyAttackState = Class{__includes = BaseState}

function EnemyAttackState:init(enemy)
	self.enemy = enemy
	self.animation = Animation {
		frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18},
		interval = 0.05,
		isLoop = false
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