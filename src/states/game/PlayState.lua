PlayState = Class{__includes = BaseState}

function PlayState:init()

end

function PlayState:enter(params)
	self.map = Map(VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end

function PlayState:update(dt)
	self.map:update(dt)
end

function PlayState:render()
	love.graphics.push()

	love.graphics.draw(gTextures['background'], gFrames['background'][1], 0, 0)
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

	love.graphics.pop()
end