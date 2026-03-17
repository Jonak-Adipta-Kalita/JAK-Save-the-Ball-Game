_G.love = require("love");

math.randomseed(os.time())

local game = require("game_state");
local points = require("points");
local fonts = require("fonts");
local game_over = require("game_over");

local Player = require("player");

local enemies_file = require("enemies");
local enemies = enemies_file.enemies;

local menu_file = require("menu");
local menu = menu_file.menu

function love.mousepressed(x, y, button, istouch, presses)
	menu.mousepressed(x, y, button, istouch, presses)
	game_over.mousepressed(x, y, button, istouch, presses)
end

function love.load()
	love.window.setTitle("JAK Save the Ball Game")
	love.mouse.setVisible(false)

	game.player = Player()

	menu.load(game.buttons.menu_state)
	game_over.load(game.buttons.ended_state)
end

function love.update(delta)
	game.player:move()

	enemies.move()

	points.update(delta)
end

function love.draw()
	love.graphics.setFont(fonts.small.font)

	love.graphics.printf(
		"FPS: " .. love.timer.getFPS(),
		fonts.small.font,
		10,
		love.graphics.getHeight() - 30,
		love.graphics.getWidth()
	);

	menu.draw()
	game_over.draw()

	enemies.draw()

	points.draw()

	game.player:draw()
end
