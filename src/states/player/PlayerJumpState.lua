PlayerJumpState = Class{__includes = BaseState}

function PlayerJumpState:init(player)
	self.player = player
	self.animation = Animation {
		frames = {15, 16, 17, 18, 19},
		interval = 0.1,
		isLoop = false
	}
	self.player.currentAnimation = self.animation
end

function PlayerJumpState:enter(params)
	self.player.dy = PLAYER_JUMP_VELOCITY
end

function PlayerJumpState:update(dt)
	self.player.currentAnimation:update(dt)
	self.player.dy = self.player.dy + GRAVITY
    self.player.y = self.player.y + (self.player.dy * dt)

    if self.player.dy >= 0 then
        self.player.stateMachine:change('falling')
    end

    if love.keyboard.isDown(LEFT) then
    	self.player.direction = 'left'
    	self.player.x = self.player.x - PLAYER_WALK_SPEED * dt
    elseif love.keyboard.isDown(RIGHT) then
    	self.player.direction = 'right'
    	self.player.x = self.player.x + PLAYER_WALK_SPEED * dt
    end

    if self.player.x <= 0 then
    	self.player.x = 0
    end

    if self.player.x >= VIRTUAL_WIDTH - PLAYER_WIDTH then
    	self.player.x = VIRTUAL_WIDTH - PLAYER_WIDTH
    end
end