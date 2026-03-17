local enemies_file = require("enemies");
local game = require("game_state");

local Button = require("button")
local Enemy = enemies_file.Enemy

local menu = {}

local function startNewGame()
	game:change_state("running")

	game.points = 0;

	game.enemies = {
		Enemy()
	}
end

function menu.load(buttons_contaier)
	buttons_contaier.play_game = Button("Play Game", startNewGame, nil, 120, 40)
	buttons_contaier.settings = Button("Settings", nil, nil, 120, 40)
	buttons_contaier.exit_game = Button("Exit Game", love.event.quit, nil, 120, 40)
end

function menu.mousepressed(x, y, button, istouch, pressed)
	if not game.state["running"] then
		if button == 1 then
			if game.state["menu"] then
				for index in pairs(game.buttons.menu_state) do
					game.buttons.menu_state[index]:checkPressed(x, y, game.player.radius)
				end
			end
		end
	end
end

function menu.draw()
	if game.state["menu"] then
		game.buttons.menu_state.play_game:draw(10, 20, 17, 10)
		game.buttons.menu_state.settings:draw(10, 70, 17, 10)
		game.buttons.menu_state.exit_game:draw(10, 120, 17, 10)
	end
end

return menu;
