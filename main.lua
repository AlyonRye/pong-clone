


require("player")
require("ball")
require("ai")
require("score")


function love.load()
	Player:load()
	Ball:load()
	AI:load()
	Score:load()
end


function love.update(dt)
	Player:update(dt)
	Ball:update(dt)
	AI:update(dt)
	Score:update(dt)
end


function love.draw()
	Player:draw()
	Ball:draw()
	AI:draw()
	Score:draw()
end

function checkCollision(a, b) -- this checks whether or not collision for a=ball is touching b=player. the right side of the ball is a.x+a.width as the starting point for any entity in love is from the left and top. if you add the width of the entity to the x starting position you get the far right side of the entity. same for height start+height=bottom. if the result is less then the starting pos of the other entitiy then no collision is taking place
	if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height >  b.y and a.y < b.y + b.height then
		return true
	else
		return false
	end
end
