_G.love = require("love");

math.randomseed(os.time())

local Player = require("player");

local game = require("game_state");
local menu = require("menu");
local enemies = require("enemies");

function love.mousepressed(x, y, button, istouch, presses)
	menu.mousepressed(x, y, button, istouch, presses)
end

function love.load()
	love.window.setTitle("JAK Save the Ball Game")
	love.mouse.setVisible(false)

	game.player = Player()

	menu.load(game.buttons.menu_state)
end

function love.update(delta)
	game.player:move()

	enemies.move()
end

function love.draw()
	love.graphics.printf(
		"FPS: " .. love.timer.getFPS(),
		love.graphics.newFont(16),
		10,
		love.graphics.getHeight() - 30,
		love.graphics.getWidth()
	);

	menu.draw()

	enemies.draw()

	game.player:draw()
end
