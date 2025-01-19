return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	keys = {
		{
			"<leader>rm",
			function()
				require("render-markdown").toggle()
			end,
			desc = "Toggle render-markdown plugin",
		},
	},
}
