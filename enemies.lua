local enemies = {}

local game = require("game_state")

function enemies.move()
	if game.state["running"] then
		for i = 1, #game.enemies do
			game.enemies[i]:move(game.player.x, game.player.y)
		end
	end
end

function enemies.draw()
	if game.state["running"] then
		for i = 1, #game.enemies do
			game.enemies[i]:draw()
		end
	end
end

return enemies;
