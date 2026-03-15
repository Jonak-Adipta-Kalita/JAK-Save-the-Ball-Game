local game = require("game_state")

function Player()
	return {
		radius = 20,
		x = 30,
		y = 30,

		move = function(self)
			self.x, self.y = love.mouse.getPosition()
		end,

		draw = function(self)
			if game.state["running"] then
				love.graphics.circle("fill", self.x, self.y, self.radius)
			end

			if not game.state["running"] then
				love.graphics.circle("fill", self.x, self.y, self.radius / 2)
			end
		end
	};
end

return Player;
