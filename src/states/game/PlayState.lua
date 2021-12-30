PlayState = Class{__includes = BaseState}

function PlayState:init()
end

function PlayState:enter(params)
	self.set = nil

	local selector = math.random(1, 4)
	if selector == 1 then
		self.set = 'grassland'
	elseif selector == 2 then
		self.set = 'autumn'
	elseif selector == 3 then
		self.set = 'tropics'
	elseif selector == 4 then
		self.set = 'winter'
	end

	self.map = Map(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, self.set)
	self.map.player.kills = params.kills

	self.isComplete = false
end

function PlayState:update(dt)
	self.map:update(dt)

	if self.map.player.health <= 0 then
		gStateMachine:change('game-over', {set = self.set, kills = self.map.player.kills})
	end

	if #self.map.enemy == #self.map.deadEnemy then
		self.isComplete = true
	end

	if self.isComplete then
		if love.keyboard.wasPressed('right') then
			gStateMachine:change('play', {kills = self.map.player.kills})
		end
	end
end

function PlayState:render()
	love.graphics.push()

	love.graphics.draw(gTextures['background-' .. self.set], gFrames['background-' .. self.set][1], 0, 0)
	self.map:render()
	
	-- render health bar
	love.graphics.draw(gTextures['hearts'], gFrames['hearts'][5], 2, 2)
	local healthBarWidth = (self.map.player.health / PLAYER_MAX_HEALTH) * 150
    love.graphics.setColor(1, 1, 0, 1)
    love.graphics.rectangle('fill', 20, 8, healthBarWidth, 5, 3)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle('line', 20, 8, 150, 5, 3)
    love.graphics.setColor(1, 1, 1, 1)

    if self.isComplete then
    	love.graphics.setFont(gFonts['medium'])
    	love.graphics.setColor(0, 0, 0, 1)
    	love.graphics.printf('Level Complete!', 1, VIRTUAL_HEIGHT / 2 + 1, VIRTUAL_WIDTH, 'center')
    	love.graphics.setColor(1, 1, 1, 1)
    	love.graphics.printf('Level Complete!', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
    end

	love.graphics.pop()
end