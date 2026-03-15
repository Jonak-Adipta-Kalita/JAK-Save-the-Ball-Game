_G.love = require("love");

math.randomseed(os.time())

local Player = require("player");
local Enemy = require("enemy");

local game = require("game_state");

local enemies = {}
local player = Player()

function love.load()
	love.window.setTitle("JAK Save the Ball Game")
	love.mouse.setVisible(false)

	table.insert(enemies, 1, Enemy())
end

function love.update(delta)
	player:move()

	for i = 1, #enemies do
		enemies[i]:move(player.x, player.y)
	end
end

function love.draw()
	love.graphics.printf(
		"FPS: " .. love.timer.getFPS(),
		love.graphics.newFont(16),
		10,
		love.graphics.getHeight() - 30,
		love.graphics.getWidth()
	);

	player:draw()


	if game.state["running"] then
		for i = 1, #enemies do
			enemies[i]:draw()
		end
	end
end
