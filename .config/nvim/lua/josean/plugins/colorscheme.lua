return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "storm", -- storm(default), moon, night, day
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
