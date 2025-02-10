return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},

	keys = {
		{
			"<leader>fl",
			mode = { "n" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
}
