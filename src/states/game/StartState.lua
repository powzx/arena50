StartState = Class{__includes = BaseState}

function StartState:init()
end

function StartState:enter(params)
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
end

function StartState:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		gStateMachine:change('play', {kills = 0})
	end
end

function StartState:render()
	love.graphics.draw(gTextures['background-' .. self.set], gFrames['background-' .. self.set][1], 0, 0)

	love.graphics.setFont(gFonts['title'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf('Arena 50', 1, VIRTUAL_HEIGHT / 2 - 40 + 1, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('Arena 50', 0, VIRTUAL_HEIGHT / 2 - 40, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf('Press Enter', 1, VIRTUAL_HEIGHT / 2 + 17, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('Press Enter', 0, VIRTUAL_HEIGHT / 2 + 16, VIRTUAL_WIDTH, 'center')
end