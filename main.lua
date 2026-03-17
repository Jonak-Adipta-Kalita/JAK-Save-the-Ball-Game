_G.love = require("love");

math.randomseed(os.time())

local game = require("game_state");
local menu = require("menu");
local points = require("points")

local Player = require("player");

local enemies_file = require("enemies");
local enemies = enemies_file.enemies;

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

	points.update(delta)
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

	points.draw()

	game.player:draw()
end
