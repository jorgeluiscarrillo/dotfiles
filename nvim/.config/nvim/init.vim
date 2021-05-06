" Automatically install vim-plug
if ! filereadable(system('echo -n "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/plugged"'))

Plug 'cocopon/iceberg.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

" Automatically executes 'filetype plugin indent on' and 'syntax enable'
call plug#end()

let mapleader = ","

" Make j and k move to the next editor line, not file line
nnoremap j gj
nnoremap k gk

" Use the '+' (CLIPBOARD) register on Linux systems for yank, delete, put etc.
set clipboard=unnamedplus

" Enable mouse
set mouse=a

" Indentation, 4 spaces
set expandtab
set shiftround
set shiftwidth=4
set tabstop=4

" Disable auto-wrap with textwidth
autocmd FileType * setlocal formatoptions-=t
" Disable auto-comment when pressing 'Enter' in INSERT or 'o'/'O' in NORMAL
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" Searching set ignorecase
set smartcase
" Clear search
map <leader><space> :let @/=''<cr>

"Show invisibles
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
map <leader>l :set list!<cr>

" User interface
set cursorline
set noshowmode
set number relativenumber
set wildmode=list:longest,full

" Color scheme
set termguicolors
colorscheme iceberg
