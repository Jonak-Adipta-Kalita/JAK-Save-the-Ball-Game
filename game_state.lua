local Game = {
	difficulty = 1,

	state = {
		menu = true,
		paused = false,
		running = false,
		ended = false,
	},

	buttons = {
		menu_state = {}
	},

	enemies = {},

	player = nil
}

return Game;
