" --- UI ---
set number
set rnu
set ruler           " Cursor position
set cursorline
set laststatus=2    " Always show status line
set showmatch       " Highlight matching brackets
set scrolloff=6
set sidescrolloff=6
set nowrap
set splitbelow      " Horizontal splits below
set splitright      " Vertical splits right

" --- Colors / Background ---
set background=dark
set termguicolors
highlight Normal ctermbg=black guibg=black

" --- Files (NO save artifacts) ---
set noswapfile
set nobackup
set nowritebackup
set noundofile
set autoread     " Reload changed files
set confirm      " Confirm before losing changes

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

" --- Performance ---
set lazyredraw
set ttyfast
syntax sync minlines=200

" --- Misc ---
set timeoutlen=500
set updatetime=300
