set nocompatible
set encoding=utf-8
set number relativenumber
set splitbelow
set splitright
set wildmode=longest,list,full
set wildmenu
set autoindent
set smartindent
set ruler
set ttyfast
set hlsearch
set smartcase

set numberwidth=1

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

	Plug 'terryma/vim-multiple-cursors'
	Plug 'tpope/vim-surround'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'vim-syntastic/syntastic'
	Plug 'jiangmiao/auto-pairs'
	Plug 'justinmk/vim-sneak'
	Plug 'tpope/vim-repeat'
	Plug 'guns/vim-sexp'
	Plug 'lifepillar/vim-solarized8'
  	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'deoplete-plugins/deoplete-jedi'
	Plug 'lifepillar/vim-solarized8'
call plug#end()

let g:deoplete#enable_at_startup = 1

let mapleader=" "

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
syntax enable
set background=light
let g:solarized_term_italics=1
let g:solarized_statusline="flat"
colorscheme solarized8_high

filetype plugin indent on

au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c,h setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS
