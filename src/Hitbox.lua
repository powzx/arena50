Hitbox = Class{}

function Hitbox:init(entity)
	self.entity = entity
	
	if self.entity.direction == 'left' then
		self.x = self.entity.x + 5
	elseif self.entity.direction == 'right' then
		self.x = self.entity.x + 30
	end
	self.y = self.entity.y

	self.width = self.entity.width - 35
	self.height = self.entity.height

	self.isEffective = false
end

function Hitbox:update(dt)
	if self.entity.direction == 'left' then
		self.x = self.entity.x + 5
	elseif self.entity.direction == 'right' then
		self.x = self.entity.x + 30
	end
	self.y = self.entity.y
end

function Hitbox:render()
	love.graphics.setColor(1, 0, 0, 1)
	love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1, 1)
end