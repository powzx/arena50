PlayerWalkingState = Class{__includes = BaseState}

function PlayerWalkingState:init(player)
	self.player = player
	self.animation = Animation {
		frames = {9, 10, 11, 12, 13, 14},
		interval = 0.1,
        isLoop = true
	}
	self.player.currentAnimation = self.animation
end

function PlayerWalkingState:update(dt)
	self.player.currentAnimation:update(dt)

	if not love.keyboard.isDown(LEFT) and not love.keyboard.isDown(RIGHT) then
        self.player.stateMachine:change('idle')
    else
    	if love.keyboard.isDown(LEFT) then
            self.player.x = self.player.x - PLAYER_WALK_SPEED * dt
            self.player.direction = 'left'
            if love.keyboard.wasPressed(JUMP) then
                self.player.stateMachine:change('jump')
            end
        elseif love.keyboard.isDown(RIGHT) then
            self.player.x = self.player.x + PLAYER_WALK_SPEED * dt
            self.player.direction = 'right'
            if love.keyboard.wasPressed(JUMP) then
                self.player.stateMachine:change('jump')
            end
        elseif love.keyboard.wasPressed(JUMP) then
            self.player.stateMachine:change('jump')
        end
    end

    if self.player.x <= 0 then
    	self.player.x = 0
    end

    if self.player.x >= VIRTUAL_WIDTH - PLAYER_WIDTH then
    	self.player.x = VIRTUAL_WIDTH - PLAYER_WIDTH
    end
end