EnemyDeadState = Class{__includes = BaseState}

function EnemyDeadState:init(enemy)
	self.enemy = enemy
	self.animation = Animation {
		frames = self.enemy.animations['dead']['frames'],
		interval = self.enemy.animations['dead']['interval'],
		isLoop = self.enemy.animations['dead']['isLoop']
	}
	self.enemy.currentAnimation = self.animation

	self.enemy.isDead = true
end

function EnemyDeadState:enter(params)
	gSounds['enemy-death']:stop()
	gSounds['enemy-death']:play()
end

function EnemyDeadState:update(dt)
	self.enemy.currentAnimation:update(dt)
end