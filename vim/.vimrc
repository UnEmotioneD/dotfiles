" --- UI ---
set number
set relativenumber
set ruler
set laststatus=2        " show status line
set showmatch           " highlight matching brackets
set scrolloff=6
set sidescrolloff=6
set nowrap
set splitbelow
set splitright

" --- Files ---
set noswapfile
set nobackup
set nowritebackup
set noundofile
set autoread            " Reload changed files
set confirm             " Confirm before losing changes

" --- Indentation ---
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set shiftround

" --- Searching ---
set ignorecase
set smartcase
set incsearch
set hlsearch

" --- Clipboard / Mouse ---
set clipboard=unnamedplus
set mouse=a

" --- Keymap ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- Syntax / Filetypes ---
syntax on
filetype plugin indent on
