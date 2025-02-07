local tokyonight = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "storm", -- storm(default) | moon | night | day
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}

local catppuccin = {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte | frappe | macchiato | mocha
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}

return tokyonight
