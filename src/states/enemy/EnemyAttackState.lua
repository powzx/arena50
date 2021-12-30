EnemyAttackState = Class{__includes = BaseState}

function EnemyAttackState:init(enemy)
	self.enemy = enemy
	self.animation = Animation {
		frames = self.enemy.animations['attack']['frames'],
		interval = self.enemy.animations['attack']['interval'],
		isLoop = self.enemy.animations['attack']['isLoop']
	}
	self.enemy.currentAnimation = self.animation

	self.enemy.hitbox.isEffective = true
end

function EnemyAttackState:update(dt)
	self.enemy.currentAnimation:update(dt)

	if self.enemy.currentAnimation.currentFrame == self.enemy.strikeFrame and self.enemy.hitbox:collides(self.enemy.map.player.hurtbox) then
		self.enemy.hitbox.isEffective = false
		self.enemy.map.player.health = self.enemy.map.player.health - 1
	end

	if self.animation.isDone then
		self.enemy.hitbox.isEffective = false
		self.enemy.stateMachine:change('idle')
	end
end