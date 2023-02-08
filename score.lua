

Score = {}

function Score:load()
	self.x = 5
	self.y = 5
	self.width = 10
	self.height = 10
	self.counter = "1"
end


function Score:update(dt)

end

function raiseScore()

end


function Score:draw()
	love.graphics.print (self.counter, self.x, self.y, self.width, self.height)
end