return {
	{
		"voldikss/vim-floaterm",
		config = function()
			-- Example configuration for floaterm
			vim.g.floaterm_width = 0.8 -- Set floaterm width (as a fraction of the screen)
			vim.g.floaterm_height = 0.8 -- Set floaterm height (as a fraction of the screen)
			vim.g.floaterm_position = "center" -- Set floaterm position
			vim.g.floaterm_autoclose = 1 -- Automatically close floaterm when process exits
		end,
	},
}
