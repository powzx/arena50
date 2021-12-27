PlayerAttackState = Class{__includes = BaseState}

function PlayerAttackState:init(player)
	self.player = player
	self.animation = Animation {
		frames = {43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59},
		interval = 0.05,
        isLoop = false
	}
	self.player.currentAnimation = self.animation

	self.player.hitbox.isEffective = true
end

function PlayerAttackState:update(dt)
	self.player.currentAnimation:update(dt)
	if self.animation.isDone then
		self.player.hitbox.isEffective = false
		self.player.stateMachine:change('idle')
	end

	for k, enemy in pairs(self.player.map.enemy) do
		if self.player.hitbox:collides(enemy.hurtbox) then
			enemy.stateMachine:change('hit')
		end
	end
end