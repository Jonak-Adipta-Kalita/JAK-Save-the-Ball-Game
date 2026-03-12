local const = require("constants")
local Player = require("player")
local Obstacle = require("obstacle")

function love.load()
	StateMachine = const.STATE_MACHINE

	Player.init()
end

function love.keypressed(key)

end

function love.update(delta)
end

function love.draw()
	Player.draw()
end
