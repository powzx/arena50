Animation = Class{}

function Animation:init(def)
    self.frames = def.frames
    self.interval = def.interval
    self.isLoop = def.isLoop
    self.isDone = false
    self.timer = 0
    self.currentFrame = 1
end

function Animation:update(dt)
    self.timer = self.timer + dt

    if self.timer > self.interval then
        self.timer = self.timer % self.interval

        if self.isLoop or not (self.currentFrame >= #self.frames) then
            self.currentFrame = math.max(1, (self.currentFrame + 1) % (#self.frames + 1))
        else
            self.isDone = true
        end
    end
end

function Animation:getCurrentFrame()
    return self.frames[self.currentFrame]
end