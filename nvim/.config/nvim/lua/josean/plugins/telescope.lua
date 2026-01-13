return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        path_display = { 'smart' },
        mappings = {
          i = {
            ['<C-h>'] = actions.select_horizontal,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<C-w>'] = actions.which_key,
            ['<C-x>'] = nil, -- disable default mapping to open in horizontal split
          },
        },
        file_ignore_patterns = {
          '.DS_Store',
          '.git/',
          '.idea/',
          '__pycache__/',
          'build/',
          'node_modules/',
        },
      },
      case_mode = 'smart_case',
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')

    local map = vim.keymap.set
    -- File pickers
    map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Files' })
    map('n', '<leader>fn', function()
      builtin.find_files({
        cwd = vim.fn.stdpath('config'),
        prompt_title = 'Nvim Config Files',
      })
    end, { desc = 'Nvim config files' })
    map('n', '<leader>fc', ':Telescope grep_string<CR>', { desc = 'String under cursor' })
    map('n', '<leader>fw', ':Telescope live_grep<CR>', { desc = 'Words' })
    -- Vim pickers
    map('n', '<leader>fC', ':Telescope colorscheme enable_preview=true<CR>', { desc = 'Colorschemes' })
    map('n', '<leader>fk', ':Telescope keymaps<CR>', { desc = 'Keymaps' })
    map('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))
    end, { desc = 'Fuzzy search buffer' })
    map('n', '<leader>fr', ':Telescope resume<CR>', { desc = 'Resume' })
    -- Git pickers
    map('n', '<leader>gC', ':Telescope git_commits<CR>', { desc = 'Repository commits' })
    map('n', '<leader>gc', ':Telescope git_bcommits<CR>', { desc = 'Buffer commits' })
  end,
}
