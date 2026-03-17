local game = require("game_state")

local points = {}

function points.update(delta)
	if game.state["running"] then
		game.points = game.points + delta
	end
end

function points.draw()
	if game.state["running"] then
		love.graphics.printf(math.floor(game.points), love.graphics.newFont(24), 0, 10, love.graphics.getWidth(),
			"center")
	end
end

return points;
