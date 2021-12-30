Hurtbox = Class{}

function Hurtbox:init(entity, offsetX, offsetY, offsetWidth, offsetHeight)
	self.entity = entity
	self.offsetX = offsetX or 0
	self.offsetY = offsetY or 0
	self.offsetWidth = offsetWidth or 0
	self.offsetHeight = offsetHeight or 0

	self.x = self.entity.x + self.offsetX
	self.y = self.entity.y + self.offsetY
	self.width = self.entity.width + self.offsetWidth
	self.height = self.entity.height + self.offsetHeight
end

function Hurtbox:update(dt)
	self.x = self.entity.x + self.offsetX
	self.y = self.entity.y + self.offsetY
end

function Hurtbox:render()
	love.graphics.setColor(1, 0, 1, 1)
	love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1, 1)
end