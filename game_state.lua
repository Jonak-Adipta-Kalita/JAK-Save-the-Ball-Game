local game = {
	difficulty = 1,

	state = {
		menu = true,
		paused = false,
		running = false,
		ended = false,
	},

	buttons = {
		menu_state = {},
		ended_state = {}
	},

	enemies = {},

	player = nil,

	points = 0,

	levels = { 15, 30, 60, 120 }
}

function game.change_state(self, state)
	self.state["menu"] = state == "menu";
	self.state["paused"] = state == "paused";
	self.state["running"] = state == "running";
	self.state["ended"] = state == "ended";
end

return game;
