

Ball = {}


function Ball:load() -- this defines the variables of the ball
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.width = 20
	self.height = 20
	self.speed = 200
	self.xVel = -self.speed
	self.yVel = 0
end


function Ball:update(dt) -- this calls both the movement and collision functions
	self:move(dt)
	self:collide()
end

function Ball:collide() -- uses the checkCollision function and local variables to determine the direction and velocity of the ball after collision has occured.
 -- this is done by defining the middle of the ball and player, subtracting the middle position of the player from the middle position if the ball.
 -- it then defines the y velocity as the resulting position * 5
	if checkCollision(self, Player) then
		self.xVel = self.speed
		local middleBall = self.y + self.height / 2
		local middlePlayer = Player.y + Player.height / 2
		local collisionPosition = middleBall - middlePlayer
		self.yVel = collisionPosition * 5
	end
	
	if checkCollision(self, AI) then
		self.xVel = -self.speed
		local middleBall = self.y + self.height / 2
		local middleAI = AI.y + AI.height / 2
		local collisionPosition = middleBall - middleAI
		self.yVel = collisionPosition * 5
	end
	
	if self.y < 0 then -- creates boundaries on the top and bottom of the screen. this is accomplished  by reading the position if the ball and comparing it to 0
	-- because 0 is the starting point and is always on the top if the balls position is less than 0 it would be out of the boundaries.
	-- so we set the position to 0 if it has become less than 0 and redefine the y velocity as negative velocity which which flips the trajectory on the y axis
		self.y = 0
		self.yVel = -self.yVel
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
		self.yVel = -self.yVel
	end
	
	if  self.x < 0 then
		self.x = love.graphics.getWidth() / 2 - self.width / 2
		self.y = love.graphics.getHeight() / 2 - self.height / 2
		self.yVel = 0
		self.xVel = self.speed
	end
	
	if self.x > love.graphics.getWidth() then
		self.x = love.graphics.getWidth() / 2 - self.width / 2
		self.y = love.graphics.getHeight() /2 - self.height / 2
		self.yVel = 0
		self.xVel = -self.speed
	end
end


function Ball:move(dt) -- this controls the movement of the ball
	self.x = self.x + self.xVel * dt
	self.y = self.y + self.yVel * dt
end


function Ball:draw() -- this draws the ball
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end