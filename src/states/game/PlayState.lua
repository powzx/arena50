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
		Timer.update(dt)

		Timer.after(3, function()
			gStateMachine:change('play', {kills = self.map.player.kills})
		end)
	end
end

function PlayState:render()
	love.graphics.push()

	love.graphics.draw(gTextures['background-' .. self.set], gFrames['background-' .. self.set][1], 0, 0)
	self.map:render()

	local health = self.map.player.health
	local heartFrame
	for i = 1, 3 do
        if health > 1 then
            heartFrame = 5
        elseif health == 1 then
            heartFrame = 3
        else
            heartFrame = 1
        end

        love.graphics.draw(gTextures['hearts'], gFrames['hearts'][heartFrame],
            (i - 1) * (TILE_SIZE + 1), 2)
        
        health = health - 2
    end

    if self.isComplete then
    	love.graphics.setFont(gFonts['medium'])
    	love.graphics.setColor(0, 0, 0, 1)
    	love.graphics.printf('Level Complete!', 1, VIRTUAL_HEIGHT / 2 + 1, VIRTUAL_WIDTH, 'center')
    	love.graphics.setColor(1, 1, 1, 1)
    	love.graphics.printf('Level Complete!', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
    end

	love.graphics.pop()
end