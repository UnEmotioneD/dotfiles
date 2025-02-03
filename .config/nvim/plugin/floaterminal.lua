-- Map <esc><esc> in terminal mode to escape to normal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)

	-- Calculate the position to center the window correctly
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create or reuse a scratch buffer
	local buf
	if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	-- Define window configuration
	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("Floaterminal", function()
	-- If the window is open, hide it.
	if vim.api.nvim_win_is_valid(state.floating.win) then
		vim.api.nvim_win_hide(state.floating.win)
		state.floating.win = -1
	else
		-- Reuse the existing terminal buffer if it's valid.
		local opts = {}
		if vim.api.nvim_buf_is_valid(state.floating.buf) then
			opts.buf = state.floating.buf
		end

		state.floating = create_floating_window(opts)
		-- If the buffer is not already a terminal, start a terminal in it.
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	end
end, {})

vim.keymap.set(
	{ "n", "t" },
	"<leader>tt",
	":Floaterminal<CR>",
	{ noremap = true, silent = true, desc = "Toggle Floating Terminal" }
)
