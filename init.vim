" TODO:
" * Markdown support
" * Server client model?
" * Learn how tabs work
" * Reflow code

" Set leader to space
let mapleader="\<SPACE>"

" True colors (will work from 0.15 and forward)
"set termguicolors

" Make <C-j> the opposite of <S-j>, just like in Evil-mode
noremap <C-j> i<CR><Esc>

" More natural splits
set splitbelow
set splitright

" Show current row and column
"set ruler

" Unknown
set showcmd
set showmatch
"set showmode

" Simplify the interaction with system clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Bind jj to escape
imap jj <Esc>

" vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-sleuth'  " Auto-detect indentation level
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'  " Distraction free mode for writing
" Disabled, too advanced for me
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'vim-pandoc/vim-pandoc'

call plug#end()

" vim-colors-solarized
set background=dark
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
let g:airline_powerline_fonts=1

" vim-pandoc settings
"let g:pandoc#formatting#mode = "ha"
