PlayerWalkingState = Class{__includes = BaseState}

function PlayerWalkingState:init(player)
	self.player = player
	self.animation = Animation {
		frames = {9, 10, 11, 12, 13, 14},
		interval = 0.1
	}
	self.player.currentAnimation = self.animation
end

function PlayerWalkingState:update(dt)
	self.player.currentAnimation:update(dt)

	if not love.keyboard.isDown('left') and not love.keyboard.isDown('right') then
        self.player.stateMachine:change('idle')
    else
    	if love.keyboard.isDown('left') then
            self.player.x = self.player.x - PLAYER_WALK_SPEED * dt
            self.player.direction = 'left'
        elseif love.keyboard.isDown('right') then
            self.player.x = self.player.x + PLAYER_WALK_SPEED * dt
            self.player.direction = 'right'
        end
    end
end