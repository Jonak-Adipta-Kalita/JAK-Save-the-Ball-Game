_G.love = require("love");

local player = require("player");

local game = {
	state = {
		menu = true,
		paused = false,
		running = false,
		ended = false,
	}
}

function love.load()
	love.window.setTitle("JAK Save the Ball Game")
	love.mouse.setVisible(false)
end

function love.update(delta)
	player.x, player.y = love.mouse.getPosition()
end

function love.draw()
	love.graphics.printf("FPS: " .. love.timer.getFPS(), love.graphics.newFont(16), 10, love.graphics.getHeight() - 30,
		love.graphics.getWidth())

	if game.state["running"] then
		love.graphics.circle("fill", player.x, player.y, player.radius)
	end

	if not game.state["running"] then
		love.graphics.circle("fill", player.x, player.y, player.radius / 2)
	end
end
