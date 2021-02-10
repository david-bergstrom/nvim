" Modeline looks for hints on first rows on files, only ever used in TDDD48.
set modeline

"set inccommand=split

" Enable 256 colors, maybe..?
set t_Co=256

" Enable mouse in all modes
set mouse=a

" Set leader to space
let mapleader="\<SPACE>"

" Vim-things, default in nvim
if !has('nvim')
    " Enable syntax highlighting
    syntax enable
endif

if has("gui_running")
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guifont=Source\ Code\ Pro\ 11
    map <Leader>0 :set guifont=Source\ Code\ Pro\ 11<CR>
    map <Leader>9 :set guifont=Source\ Code\ Pro\ 13<CR>
endif

"set guifont=Gohu\ Gohufont\ 11,gohufont\ 11<CR>
"map <Leader>0 :set guifont=Gohu\ Gohufont\ 11,gohufont\ 11<CR>
"map <Leader>9 :set guifont=Gohu\ Gohufont\ 8,gohufont\ 8<CR>

" TODO: Send to Henning
"map <ScrollWheelUp> <C-r>
"map <ScrollWheelDown> u

" Relative line numbers are cool
set relativenumber
set number

" Use case sensitive search only when a capital character is present
set ignorecase
set smartcase

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

inoremap <C-D> <C-R>=strftime("%Y-%m-%d")<CR>
nnoremap <C-D> <C-R>=strftime("%Y-%m-%d")<CR>

nnoremap <leader>n :noh<CR>

nnoremap <leader>l :!clear && glow -s dark %<CR>

" Tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
" Indentation of C, see cinoptions
set cino=

" Spelling settings
set spelllang=sv,en

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'  " Find files quickly
Plug 'tpope/vim-sleuth'  " Auto-detect indentation level
Plug 'airblade/vim-gitgutter'  " View git status
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'tpope/vim-surround' " Surround things
Plug 'tpope/vim-repeat' " Improve repeat to work with vim-surround
Plug 'tpope/vim-fugitive' " Awesome git integration
Plug 'SirVer/ultisnips' " Snippets are cool
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'  " Superior color theme

" Old plugins, no longer used
"Plug 'junegunn/goyo.vim'  " Distraction free mode for writing
"Plug 'tpope/vim-sensible' " Sensible default settings (not needed in nvim)
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }
"Plug 'PontusPersson/pddl.vim' " PDDL syntax highlighting
"Plug 'matze/vim-tex-fold'
"Plug 'unblevable/quick-scope'
"Plug 'taketwo/vim-ros' " Mode for Robotic Operating System
"Plug 'junegunn/rainbow_parentheses.vim' " Rainbow parantheses, great for vim

call plug#end()

" vim-colors-solarized
"set background=light
set background=dark
colorscheme solarized
"call togglebg#map("<F5>")
let g:solarized_termcolors=256
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Workaround to make git gutter visible when using solarized
highlight clear SignColumn
"highlight GitGutterAdd ctermfg=green
"highlight GitGutterChange ctermfg=yellow
"highlight GitGutterDelete ctermfg=red
"highlight GitGutterChangeDelete ctermfg=yellow

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
"let g:airline_theme='solarized'
"let g:airline_powerline_fonts=1

if !has('nvim')
    set laststatus=2
endif

nnoremap <leader>g :Goyo<CR>

" vim-pandoc settings
"let g:pandoc#modules#enabled = ["toc"]
let g:pandoc#modules#disabled = ["folding"]
" Disable convertion to digraphs
"let g:pandoc#syntax#conceal#use = 0
"let g:pandoc#formatting#mode = "ha"
let g:pandoc#formatting#mode = "s"
"let g:pandoc#folding#fold_yaml = 1
"let g:pandoc#folding#fdc = 0

nnoremap <Leader>c :w<CR>:Pandoc pdf<CR>

" YCM
" let g:ycm_semantic_triggers = {
" \   'roslaunch' : ['="', '$(', '/'],
" \   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
" \ }

"let g:ycm_extra_conf_globlist = ['~/ws/*', '~/TDDE05/*']
"let g:ycm_filetype_blacklist = { 'tex': 1 }

" Rainbow parentheses
" augroup rainbow_lisp
"   autocmd!
"   autocmd FileType lisp,clojure,scheme,pddl RainbowParentheses
" augroup END

"augroup tdde19-notes
"  autocmd!
"  autocmd BufWrite /home/david/repos/tdde19/tdde19-notes.md :silent !~/repos/tdde19/upload.sh&
"augroup END

let g:UltiSnipsExpandTrigger="<c-j>"

if has('nvim')
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
else
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/ultisnips']
endif

