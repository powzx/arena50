EnemyHitState = Class{__includes = BaseState}

function EnemyHitState:init(enemy, animationInfo)
	self.enemy = enemy
	self.animation = Animation {
		frames = animationInfo['frames'],
		interval = animationInfo['interval'],
		isLoop = animationInfo['isLoop']
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
		self.enemy.map.player.kills = self.enemy.map.player.kills + 1
		table.insert(self.enemy.map.deadEnemy, self.enemy)
		self.enemy.stateMachine:change('dead')
	end
end