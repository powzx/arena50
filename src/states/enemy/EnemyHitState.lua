EnemyHitState = Class{__includes = BaseState}

function EnemyHitState:init(enemy)
	self.enemy = enemy
	self.animation = Animation {
		frames = self.enemy.animations['hit']['frames'],
		interval = self.enemy.animations['hit']['interval'],
		isLoop = self.enemy.animations['hit']['isLoop']
	}
	self.enemy.currentAnimation = self.animation
end

function EnemyHitState:update(dt)
	self.enemy.currentAnimation:update(dt)
	if self.animation.isDone then
		self.enemy.stateMachine:change('idle')
	end

	if self.enemy.health <= 0 then
		-- increase player health after each kill up to the player's max health
		self.enemy.map.player.health = math.min(self.enemy.map.player.maxHealth, self.enemy.map.player.health + (0.5 * self.enemy.maxHealth))
		self.enemy.map.player.kills = self.enemy.map.player.kills + 1
		table.insert(self.enemy.map.deadEnemy, self.enemy)
		self.enemy.stateMachine:change('dead')
	end
end