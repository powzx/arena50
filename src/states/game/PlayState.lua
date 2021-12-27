PlayState = Class{__includes = BaseState}

function PlayState:init()

end

function PlayState:enter(params)
	self.map = Map(VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
	self.player = Player(self.map)
	self.enemy = Enemy(self.map)
end

function PlayState:update(dt)
	self.map:update(dt)
	self.player:update(dt)
	self.enemy:update(dt)
end

function PlayState:render()
	love.graphics.push()

	love.graphics.draw(gTextures['background'], gFrames['background'][1], 0, 0)
	self.map:render()
	self.player:render()
	self.enemy:render()

	love.graphics.pop()
end