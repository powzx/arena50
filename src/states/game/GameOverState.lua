GameOverState = Class{__includes = BaseState}

function GameOverState:init()
end

function GameOverState:enter(params)
	self.set = params.set
	self.kills = params.kills
end

function GameOverState:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		gStateMachine:change('start')
	end
end

function GameOverState:render()
	love.graphics.draw(gTextures['background-' .. self.set], gFrames['background-' .. self.set][1], 0, 0)

	love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf('Game Over', 1, VIRTUAL_HEIGHT / 2 - 40 + 1, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('Game Over', 0, VIRTUAL_HEIGHT / 2 - 40, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf('You beat a total of ' .. self.kills .. ' monsters!', 1, VIRTUAL_HEIGHT / 2 + 17, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('You beat a total of ' .. self.kills .. ' monsters!', 0, VIRTUAL_HEIGHT / 2 + 16, VIRTUAL_WIDTH, 'center')
end