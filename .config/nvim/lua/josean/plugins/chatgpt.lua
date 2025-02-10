return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			-- api_key_cmd = "pass show api/tokens/openai",
			api_key_cmd = "echo $", -- to silence warning when not in use
			openai_params = {
				model = "gpt-4o",
				frequency_penalty = 0,
				presence_penalty = 0,
				max_tokens = 4095,
				temperature = 0.2,
				top_p = 0.1,
				n = 1,
			},
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {},
}
