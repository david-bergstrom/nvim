" TODO:
" * Markdown support
" * Server client model?
" * Learn how tabs work
" * Reflow code

if !has('nvim')
    " Vim-things, default in nvim
    syntax enable
    set mouse=a
    let &t_Co=256
endif

" Set leader to space
let mapleader="\<SPACE>"

" True colors (will work from 0.15 and forward)
"set termguicolors

" Save faster
noremap <leader>w :w<CR>

" Bind jj to escape
imap jj <Esc>

" Make <C-j> the opposite of <S-j>, just like in Evil-mode
noremap <C-j> i<CR><Esc>

" More natural splits
set splitbelow
set splitright

" Show current row and column
"set ruler

" Show partially entered command
set showcmd

" Set .pl files to prolog
let g:filetype_pl="prolog"

" Simplify the interaction with system clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
" Indentation of C, see cinoptions
set cino=

" Spelling settings
set spelllang=sv,en

" vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'altercation/vim-colors-solarized'  " Superior color theme
Plug 'ctrlpvim/ctrlp.vim'  " Find files quickly
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-sleuth'  " Auto-detect indentation level
Plug 'bling/vim-airline'  " Cool statusbar
Plug 'vim-airline/vim-airline-themes'  " Solarized theme (amongst other)
Plug 'junegunn/goyo.vim'  " Distraction free mode for writing
Plug 'airblade/vim-gitgutter'  " View git status
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'tpope/vim-surround' " Surround things
Plug 'tpope/vim-repeat' " Improve repeat to work with vim-surround

call plug#end()

" vim-colors-solarized
set background=dark
"set background=light
colorscheme solarized

" CtrlP settings

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" vim-airline settings
let g:airline_theme='solarized'
" let g:airline_powerline_fonts=1

if !has('nvim')
    set laststatus=2
endif

" vim-pandoc settings
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#formatting#mode = "ha"
nnoremap <Leader>c :w<CR>:Pandoc pdf<CR>

nnoremap <Leader>g :Goyo<CR>
