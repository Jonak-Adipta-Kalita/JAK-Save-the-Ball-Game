function Enemy()
	local dice = math.random(1, 4)
	local _x, _y
	local _radius = 20

	if dice == 1 then -- come from above
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
		level = 1,
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
		end
	};
end

return Enemy;
