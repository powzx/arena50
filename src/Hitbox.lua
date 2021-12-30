Hitbox = Class{}

function Hitbox:init(entity, offsetXLeft, offsetXRight, offsetY, offsetWidth, offsetHeight)
	self.entity = entity
	self.offsetXLeft = offsetXLeft
	self.offsetXRight = offsetXRight
	self.offsetY = offsetY
	self.offsetWidth = offsetWidth
	self.offsetHeight = offsetHeight

	if self.entity.direction == 'left' then
		self.x = self.entity.x + self.offsetXLeft
	elseif self.entity.direction == 'right' then
		self.x = self.entity.x + self.offsetXRight
	end
	self.y = self.entity.y + self.offsetY

	self.width = self.entity.width + self.offsetWidth
	self.height = self.entity.height + self.offsetHeight

	self.isEffective = false
end

function Hitbox:update(dt)
	if self.entity.direction == 'left' then
		self.x = self.entity.x + self.offsetXLeft
	elseif self.entity.direction == 'right' then
		self.x = self.entity.x + self.offsetXRight
	end
	self.y = self.entity.y + self.offsetY
end

function Hitbox:render()
	love.graphics.setColor(1, 0, 0, 1)
	love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1, 1)
end

function Hitbox:collides(target)
	return self.isEffective and not (target.x > self.x + self.width or self.x > target.x + target.width or 
		target.y > self.y + self.height or self.y > target.y + target.height)
end