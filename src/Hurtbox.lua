Hurtbox = Class{}

function Hurtbox:init(entity)
	self.entity = entity
	
	self.x = self.entity.x + 20
	self.y = self.entity.y
	self.width = self.entity.width - 40
	self.height = self.entity.height
end

function Hurtbox:update(dt)
	self.x = self.entity.x + 20
	self.y = self.entity.y
end

function Hurtbox:render()
	love.graphics.setColor(1, 0, 1, 1)
	love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1, 1)
end