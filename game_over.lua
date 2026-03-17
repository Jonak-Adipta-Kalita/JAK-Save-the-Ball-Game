local game_over = {}

local menu_file = require("menu")
local game = require("game_state")
local fonts = require("fonts")

local startNewGame = menu_file.startNewGame;

function game_over.load(buttons_container)
	buttons_container.replay = Button("Replay", startNewGame, nil, 120, 40)
	buttons_container.menu = Button("Menu", game.change_state, { game, "menu" }, 120, 40)
	buttons_container.exit_game = Button("Exit Game", love.event.quit, nil, 120, 40)
end

function game_over.mousepressed(x, y, button, istouch, pressed)
	if not game.state["running"] then
		if button == 1 then
			if game.state["ended"] then
				for index in pairs(game.buttons.ended_state) do
					game.buttons.ended_state[index]:checkPressed(x, y, game.player.radius)
				end
			end
		end
	end
end

local width = love.graphics.getWidth() / 2.25
local height = love.graphics.getHeight()

function game_over.draw()
	if game.state["ended"] then
		love.graphics.printf("Score: " .. math.floor(game.points), fonts.medium.font, 0, height / 2 - fonts.medium.size,
			width * 2.25,
			"center")

		game.buttons.ended_state.replay:draw(width, height / 1.8, 17, 10)
		game.buttons.ended_state.menu:draw(width, height / 1.53, 17, 10)
		game.buttons.menu_state.exit_game:draw(width, height / 1.33, 17, 10)
	end
end

return game_over;
