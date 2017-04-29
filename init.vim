" Modeline looks for hints on first rows on files, only ever used in TDDD48.
" Remove when course is finished
set modeline

" Vim-things, default in nvim
if !has('nvim')
    " Enable syntax highlighting
    syntax enable
   " Enable mouse in all modes
    set mouse=a
    " Enable 256 colors, maybe..?
    let &t_Co=256
endif

" TODO: Send to Henning
"map <ScrollWheelUp> <C-r>
"map <ScrollWheelDown> u

" Set leader to space
let mapleader="\<SPACE>"

" Relative line numbers are cool
set relativenumber
set number

" Save faster
noremap <leader>w :w<CR>

" Bind jj to escape
imap jj <Esc>

" Make <C-j> the opposite of <S-j>, just like in Evil-mode
noremap <C-j> i<CR><Esc>

" Make Y copy the entire row
nnoremap Y y$

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
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>y "+y

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

Plug 'tpope/vim-sensible' " Sensible default settings (not needed in nvim)
Plug 'altercation/vim-colors-solarized'  " Superior color theme
Plug 'ctrlpvim/ctrlp.vim'  " Find files quickly
Plug 'tpope/vim-sleuth'  " Auto-detect indentation level
Plug 'bling/vim-airline'  " Cool statusbar
Plug 'vim-airline/vim-airline-themes'  " Solarized theme (amongst other)
Plug 'junegunn/goyo.vim'  " Distraction free mode for writing
Plug 'airblade/vim-gitgutter'  " View git status
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'tpope/vim-surround' " Surround things
Plug 'tpope/vim-repeat' " Improve repeat to work with vim-surround
Plug 'taketwo/vim-ros' " Mode for Robotic Operating System
Plug 'tpope/vim-fugitive' " Awesome git integration
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'PontusPersson/pddl.vim' " PDDL syntax highlighting
Plug 'junegunn/rainbow_parentheses.vim' " Rainbow parantheses, great for vim

call plug#end()

" vim-colors-solarized
set background=dark
"set background=light
colorscheme solarized

" CtrlP settings

" Tag support
let g:ctrlp_extensions = ['tag']
nnoremap <Leader>t :CtrlPTag<CR>
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

" YCM
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }

let g:ycm_extra_conf_globlist = ['~/ws/*', '~/TDDE05/*']

" Rainbow parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,pddl RainbowParentheses
augroup END
