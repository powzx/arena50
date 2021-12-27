PlayerIdleState = Class{__includes = BaseState}

function PlayerIdleState:init(player)
	self.player = player
	self.animation = Animation {
		frames = {1, 2, 3, 4},
		interval = 0.1,
		isLoop = true
	}
	self.player.currentAnimation = self.animation
end

function PlayerIdleState:update(dt)
	self.player.currentAnimation:update(dt)

	if love.keyboard.isDown(LEFT) or love.keyboard.isDown(RIGHT) then
        self.player.stateMachine:change('walking')
    elseif love.keyboard.wasPressed(JUMP) then
    	self.player.stateMachine:change('jump')
    elseif love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    	self.player.stateMachine:change('attack')
    end

    if not self.player:checkTileBeneath() then
		self.player.stateMachine:change('falling')
	end
end