-- set leader key to space
vim.g.mapleader = " "

local map = vim.keymap -- for conciseness

---------------------
-- General Keymaps --
---------------------

-- use jk to exit insert mode
-- map.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
map.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
map.set("n", "x", '"_x')

-- delete all marks
map.set("n", "<leader>dm", "<cmd>delm!<CR>", { desc = "Delete all marks" })

-- increment/decrement numbers
map.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
map.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

map.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
map.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
map.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
map.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
map.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- write/quite
map.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Write current file" })
map.set("n", "<leader>wa", "<cmd>wa<CR>", { desc = "Write all file" })
map.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quite current buffer" })
map.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quite all buffer" })
map.set("n", "<leader>wq", "<cmd>wqa<CR>", { desc = "Write and quite all buffer" })

-- floaterm
map.set("n", "<leader>fo", ":FloatermToggle<CR>", { desc = "Toggle Floaterm" })
map.set("n", "<leader>fn", ":FloatermNew<CR>", { desc = "New Floaterm" })
map.set("n", "<leader>fk", ":FloatermKill<CR>", { desc = "Kill Floaterm" })

-- lazy
map.set("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Open Lazy" })

-- lazy git
map.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open lazy git" })

-- neoclip
map.set("n", "<leader>nc", "<cmd>Telescope neoclip<CR>", { desc = "Neoclip" })

-- chatgpt
map.set("n", "<leader>go", "<cmd>ChatGPT<CR>", { desc = "Open normal ChatGPT" })
map.set("n", "<leader>ge", "<cmd>ChatGPTEditWithInstruction<CR>", { desc = "Edit with instruction" })
map.set("n", "<leader>gg", "<cmd>ChatGPTRun grammar_correction<CR>", { desc = "Correct grammer" })
map.set("n", "<leader>gf", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "Fix bugs" })

-- markdown preview
map.set("n", "<leader>pm", "<cmd>MarkdownPreview<CR>", { desc = "Preview Markdown" })

-- obsidian
map.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian" })

-- treesitter
map.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
map.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
map.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
map.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- trouble
map.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open trouble workspace diagnostics" })
map.set(
	"n",
	"<leader>xd",
	"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "Open trouble document diagnostics" }
)
map.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Open trouble quickfix list" })
map.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Open trouble location list" })
map.set("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", { desc = "Open todos in trouble" })
