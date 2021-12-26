PlayerIdleState = Class{__includes = BaseState}

function PlayerIdleState:init(player)
	self.player = player
	self.animation = Animation {
		frames = {1, 2, 3, 4},
		interval = 0.1
	}
	self.player.currentAnimation = self.animation
end

function PlayerIdleState:update(dt)
	self.player.currentAnimation:update(dt)

	if love.keyboard.isDown('left') or love.keyboard.isDown('right') then
        self.player.stateMachine:change('walking')
    end
end