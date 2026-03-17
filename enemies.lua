local game = require("game_state")

local enemies = {}

function enemies.move()
	if game.state["running"] then
		for i = 1, #game.enemies do
			if not game.enemies[i]:checkTouched() then
				game.enemies[i]:move(game.player.x, game.player.y)

				for j = 1, #game.levels do
					if math.floor(game.points) == game.levels[i] then
						table.insert(game.enemies, Enemy(game.difficulty * (i + 1)))
						game.points = game.points + 1
					end
				end
			else
				game:change_state("menu")
			end
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

function Enemy(level)
	local dice = math.random(1, 4)
	local _x, _y
	local _radius = 20

	if dice == 1 then
		_x = math.random(_radius, love.graphics.getWidth())
		_y = -_radius * 4
	elseif dice == 2 then
		_x = -_radius * 4
		_y = math.random(_radius, love.graphics.getHeight())
	elseif dice == 3 then
		_x = math.random(_radius, love.graphics.getWidth())
		_y = love.graphics.getHeight() + (_radius * 4)
	else
		_x = love.graphics.getWidth() + (_radius * 4)
		_y = math.random(_radius, love.graphics.getHeight())
	end

	return {
		level = level or 1,
		radius = _radius,

		x = _x,
		y = _y,

		move = function(self, player_x, player_y)
			local x_move = player_x - self.x;
			local y_move = player_y - self.y;

			if x_move > 0 then
				self.x = self.x + self.level;
			elseif x_move < 0 then
				self.x = self.x - self.level;
			end

			if y_move > 0 then
				self.y = self.y + self.level;
			elseif y_move < 0 then
				self.y = self.y - self.level;
			end
		end,

		draw = function(self)
			love.graphics.setColor(1, 0.5, 0.7);
			love.graphics.circle("fill", self.x, self.y, self.radius);

			love.graphics.setColor(1, 1, 1);
		end,

		checkTouched = function(self)
			return math.sqrt((self.x - game.player.x) ^ 2 + (self.y - game.player.y) ^ 2) <=
				game.player.radius * 2
		end
	};
end

return { enemies = enemies, Enemy = Enemy };
