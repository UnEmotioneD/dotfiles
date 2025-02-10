return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		require("Comment").setup({
			pre_hook = ts_context_commentstring.create_pre_hook(), -- for commenting tsx, jsx, svelte, html files
		})
	end,
}
