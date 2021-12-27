PlayerFallingState = Class{__includes = BaseState}

function PlayerFallingState:init(player)
	self.player = player
	self.animation = Animation {
		frames = {23, 24},
		interval = 0.1,
		isLoop = true
	}
	self.player.currentAnimation = self.animation
end

function PlayerFallingState:update(dt)
	self.player.currentAnimation:update(dt)
	self.player.dy = self.player.dy + GRAVITY
	self.player.y = self.player.y + self.player.dy * dt

	if love.keyboard.isDown(LEFT) then
		self.player.direction = 'left'
		self.player.x = self.player.x - PLAYER_WALK_SPEED * dt
	elseif love.keyboard.isDown(RIGHT) then
		self.player.direction = 'right'
		self.player.x = self.player.x + PLAYER_WALK_SPEED * dt
	end

	local groundY = self.player:checkTileBeneath()
	if groundY then
		self.player.dy = 0
		self.player.y = groundY - PLAYER_HEIGHT + 1
		self.player.stateMachine:change('idle')
	end

	-- local limitX = self.player:checkTileSide()
	-- if limitX then
	-- 	self.player.dx = 0
	-- 	if self.player.direction == 'left' then
	-- 		self.player.x = limitX + TILE_SIZE - 20
	-- 	elseif self.player.direction == 'right' then
	-- 		self.player.x = limitX - PLAYER_WIDTH + 20
	-- 	end
	-- end

	if self.player.x <= 0 then
    	self.player.x = 0
    end

    if self.player.x >= VIRTUAL_WIDTH - PLAYER_WIDTH then
    	self.player.x = VIRTUAL_WIDTH - PLAYER_WIDTH
    end
end