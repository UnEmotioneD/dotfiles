return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=LAZYVIM
		dashboard.section.header.val = {
			"                                                                                                  ",
			"                                                                                                  ",
			"                                                                                                  ",
			"                                                                                                  ",
			"                                                                                                  ",
			"                                                                                                  ",
			"                                                                                                  ",
			"                                                                                                  ",
			"                                                                                                  ",
			"                                                                                                  ",
			"  ██╗   ██╗███╗   ██╗███████╗███╗   ███╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗██████╗   ",
			"  ██║   ██║████╗  ██║██╔════╝████╗ ████║██╔═══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝██╔══██╗  ",
			"  ██║   ██║██╔██╗ ██║█████╗  ██╔████╔██║██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║█████╗  ██║  ██║  ",
			"  ██║   ██║██║╚██╗██║██╔══╝  ██║╚██╔╝██║██║   ██║   ██║   ██║██║   ██║██║╚██╗██║██╔══╝  ██║  ██║  ",
			"  ╚██████╔╝██║ ╚████║███████╗██║ ╚═╝ ██║╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║███████╗██████╔╝  ",
			"   ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝     ╚═╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═════╝   ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > File explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯  > Restore Session", "<cmd>SessionRestore<CR>"),
			dashboard.button("l", "  > Open Lazy", "<cmd>Lazy<CR>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}

		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#7aa2f7", bold = true })
		dashboard.section.header.opts.hl = "AlphaHeader"

		alpha.setup(dashboard.opts)

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
