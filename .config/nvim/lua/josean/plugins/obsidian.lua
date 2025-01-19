return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "React",
				path = "~/Documents//vaults/React",
			},
		},
		ui = { enable = false },
	},
}
