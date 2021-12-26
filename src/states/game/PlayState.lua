PlayState = Class{__includes = BaseState}

function PlayState:init()
	self.camX = 0
    self.camY = 0

    self.backgroundX = 0
end

function PlayState:enter(params)
end

function PlayState:exit()
end

function PlayState:update(dt)
	Timer.update(dt)
	self:updateCamera()
end

function PlayState:render()
	love.graphics.push()

	love.graphics.draw(gTextures['background'], gFrames['background'][1], math.floor(-self.backgroundX), 0)
	love.graphics.draw(gTextures['background'], gFrames['background'][1], math.floor(-self.backgroundX),
        gTextures['background']:getHeight() / 3 * 2, 0, 1, -1)
    love.graphics.draw(gTextures['background'], gFrames['background'][1], math.floor(-self.backgroundX + 288), 0)
    love.graphics.draw(gTextures['background'], gFrames['background'][1], math.floor(-self.backgroundX + 288),
        gTextures['background']:getHeight() / 3 * 2, 0, 1, -1)
	love.graphics.translate(-math.floor(self.camX), -math.floor(self.camY))

	love.graphics.pop()
end

function PlayState:updateCamera()
	Timer.after(1, function()
		self.camX = self.camX + 1
	end)

    self.backgroundX = (self.camX / 3) % 288
end