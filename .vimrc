set nocompatible    " disable vi compatibility
"Plugins {{{
"Automatically pull in vim plug if it isn't installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
 
call plug#begin('~/.vim/plugged')
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'morhetz/gruvbox'
    Plug 'ervandew/supertab'
    Plug 'junegunn/goyo.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'dylanaraps/wal.vim'
    Plug 'lervag/vimtex'
    Plug 'eagletmt/neco-ghc'
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
    Plug 'alx741/vim-hindent'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'ARM9/arm-syntax-vim'
    Plug 'uiiaoo/java-syntax.vim'
    Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'
    Plug 'rmolin88/pomodoro.vim'
"Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'ap/vim-css-color'
    "Python
    Plug 'nvie/vim-flake8'
    Plug 'ryanoasis/vim-devicons'   "Load this last
    Plug 'Shougo/deoplete.nvim'
call plug#end()

set mouse=a


let g:onedark_hide_endofbuffer = 1

let g:deoplete#enable_at_startup = 0

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_complete_close_braces = 1
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_smart_case = 1
let g:vimtex_complete_ignore_case = 1
let g:tex_flavor = 'latex'
"
 let g:startify_custom_header = [
              \ ]

let g:hindent_on_save = 0
au FileType haskell nnoremap <silent> <leader>ph :Hindent<CR>

let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2

let g:goyo_width = "95%"
let g:goyo_height = "90%"

"NerdTree
map <F3> :NERDTreeToggle<CR>
 
" }}}
"Colors {{{
"if exists('+termguicolors')
set termguicolors
"endif
syntax enable
"set t_Co=256
colo dracula
 
"}}}
"Syntax{{{
augroup asm_syntax
    au!
    autocmd BufNewFile,BufRead *.sflisp set syntax=sflisp
    autocmd BufRead,BufNewFile *neomutt-* set syntax=mail
    autocmd BufRead,BufNewFile *.c* set syntax=c
    autocmd BufRead,BufNewFile *.cpp* set syntax=cpp
    au BufNewFile,BufRead *.s,*.S,*.asm set filetype=arm " arm = armv6/7
augroup END
"}}}
"Spaces and Tabs{{{
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set autoindent          "always turn on indentation
set breakindent         "Wrap lines at same indent level
set shiftwidth=4        "Spaces to use for autoindenting
set backspace=indent,eol,start " proper backspace behavior
"}}}
"UI Config{{{
set number                          " show line numbers
set showcmd                         " show command in bottom bar
set cursorline                      " highlight current line
filetype indent on                  " load filetype-specific indent files
set wildmenu                        " visual autocomplete for command menu
set lazyredraw                      " redraw only when we need to.
set showmatch                       " highlight matching [{()}]
set scrolloff=5                     " always leave 5 spaces when scrolling
set linebreak                       " don't wrap words
set noshowmode                      " Statusline already shows mode so remove it from under it
set timeoutlen=1000 ttimeoutlen=10  "Eliminate delay when changing mode
let $VTE_VERSION="100"              "Trying to fix weird bug
" Splits
 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
"}}}
"Leader Shortcuts{{{
let mapleader=","       " leader is comma
"Open vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
"}}}
"Searching {{{
set incsearch           " search as characters are entered
set ignorecase          " do case insensitive search 
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
"}}}
"Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
nnoremap <space> za
" }}}
"Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
"}}}
"Omnicompletion{{{
filetype plugin on
set omnifunc=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"}}}
"StatusLine{{{

let g:lightline = { 
        \ 'colorscheme': 'darcula', 
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename'] ],
        \   'right': [ [ 'lineinfo' ], 
        \              [ 'pomodoro', 'percent' ] ]
        \ }
        \}
let g:lightline.component = {
        \ 'pomodoro': '%{PomodoroStatus()}'
        \ }

function! PomodoroStatus() abort"{{{
if pomo#remaining_time() ==# '0'
return "Stopped"
else
return "".pomo#remaining_time()
endif
endfunction"}}}

"{{{pomodoro.vim
let g:Pomodoro_Status = 0
function! Toggle_Pomodoro()
if g:Pomodoro_Status == 0
let g:Pomodoro_Status = 1
execute 'PomodoroStart'
elseif g:Pomodoro_Status == 1
let g:Pomodoro_Status = 0
execute 'PomodoroStop'
endif
endfunction
let g:pomodoro_time_work = 25
let g:pomodoro_time_slack = 5
map <F6> :<c-u>call Toggle_Pomodoro()<cr>

set laststatus=2
hi Normal guibg=NONE ctermbg=NONE
hi PrimaryBlock   guibg=#bd93f9 guifg=#282828 ctermfg=00 ctermbg=06
"hi SecondaryBlock guibg=#ECCF95 guifg=#282828 ctermfg=00 ctermbg=04
"hi ThirdBlock     guibg=#A3BE8C guifg=#282828 ctermfg=00 ctermbg=02
 
set statusline=
set statusline+=%#PrimaryBlock#             "Change color
set statusline+=\ %t\ %(%m%)                  "File name(tail) and modified flag
set statusline+=%#Blank#                    "Change color
"set statusline+=\ %f                        "Full file path
set statusline+=\ %Y\ %{WebDevIconsGetFileTypeSymbol()}                       "Show file type in capitals
set statusline+=%=                          "Adds the middle padding
set statusline+=%#PrimaryBlock#           "Change color
set statusline+=\ Ln\ %l:\ %c\              "Line and Column
set statusline+=%#Blank#               "Change color
 
"}}}
"Commands{{{
"Search the notes directory for a pattern, using the shortcut defined
command! -nargs=1 Ngrep vimgrep "<args>" $NOTES_DIR/CS-Y3/**/*.md
nnoremap <leader>[ :Ngrep
 

if &term =~ '256color'
" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
        set t_ut=
endif

set nocursorline

let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

noremap <C-s> :G add % <CR>
noremap <C-f> :G commit <CR>
noremap <C-g> :G push -u origin 

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
let NERDTreeQuitOnOpen = 1
set fillchars+=vert:\ 
hi VertSplit guibg=#424450 guifg=#424450

set spelllang=sv,en
" Spelling mistakes will also be colored red if you uncomment the colors.
hi SpellBad cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline "ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline "ctermfg=203 guifg=#ff5f5f

" Toggle spell check.
map <F5> :setlocal spell!<CR>
imap <s-tab> <c-x>s
nmap <F7> :Goyo<CR>
