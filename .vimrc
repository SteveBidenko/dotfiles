""""""""""""""""""""""""""""""""

" Vundle
""""""""""""""""""""""""""""""""

set nocompatible
filetype off

set nowrap

set rtp+=/home/anderson/.vim/bundle/Vundle.vim
set t_Co=256
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
" Plugin 'majutsushi/tagbar'          	" Class/module browser
Plugin 'scrooloose/nerdcommenter'

" Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'wincent/command-t'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

" Plugin 'michaeljsmith/vim-indent-object'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'

Plugin 'terryma/vim-expand-region'

"Plugin 'python-mode/python-mode'

" Plugin 'kevinw/pyflakes-vim'

Plugin 'vim-syntastic/syntastic'

Plugin 'Vimjas/vim-python-pep8-indent'

Plugin 'ryanoasis/vim-devicons'

"Plugin 'ervandew/supertab'

"Plugin 'Valloric/YouCompleteMe'

" Plugin 'nvie/vim-flake8'

"Bundle 'jistr/vim-nerdtree-tabs'
" Plugin 'jistr/vim-nerdtree-tabs'


call vundle#end()            		" required

filetype on
filetype plugin on
filetype plugin indent on


""""""""""""""""""""""""""""""""
" Configs
""""""""""""""""""""""""""""""""


syntax enable
colorscheme molokai
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" Plugin 'sickill/vim-monokai'

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

set guifont=DejaVu\ Sans\ Mono\ 9

:set virtualedit=onemore

set splitbelow
set splitright
" g$:set ve= ve=all<CR>
nnoremap <End> g$
set number
set relativenumber

set whichwrap+=<,>,h,l,[,]


"turn off status line
"set laststatus=0
set ls=0
set showtabline=1
"set tabline="what status line equals, or equaled or whatever"
"set or change the color of the tabline
" hi tablinefill cterm=none ctermbg=blue ctermfg=white gui=none guibg=blue guifg=white

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '│'
let g:airline#extensions#tabline#left_alt_sep = '⎸'
"map <F2> :!ls<CR>:e

":verbose nnoremap <C-[> :tabprevious<CR>
":verbose nnoremap <C-]> :tabnext<CR>
"inoremap <C-[> <Esc>:tabprevious<CR>icd ~/
"inoremap <C-]> <Esc>:tabnext<CR>i

"nnoremap <C-;> :tabprevious<CR>
"nnoremap <C-'>   :tabnext<CR>
"nnoremap <C-n>     :tabnew<CR>
"inoremap <C-S-tab> <Esc>:tabprevious<CR>i
"inoremap <C-tab>   <Esc>:tabnext<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap <silent> <ESC>[5;2~ :bp<CR>
nnoremap <silent> <ESC>[6;2~ :bn<CR>
nnoremap <silent> <ESC>[1;3D <C-w>h
nnoremap <silent> <ESC>[1;3C <C-w>l
nnoremap <silent> o <C-w>w


" inoremap <silent> <ESC>[5;2~ <ESC>:bp<CR>i
" inoremap <silent> <ESC>[6;2~ <ESC>:bn<CR>i
inoremap <silent> <ESC>[5;2~ <ESC>:bp<CR>
inoremap <silent> <ESC>[6;2~ <ESC>:bn<CR>

nnoremap <silent> <ESC>[1;5D b
nnoremap <silent> <ESC>[1;5C w
inoremap <silent> <ESC>[1;5D <C-o>b
inoremap <silent> <ESC>[1;5C <C-o>w

"nnoremap <C-[> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
"nnoremap <C-]> ddp

nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

" nnoremap <silent> <C-n>      :tabnew<CR>
" nnoremap <silent> <C-o>      :CtrlPMixed<CR>
nnoremap <silent> <C-p>      :CtrlPMixed<CR>
nnoremap <silent> <C-x>      :bd<CR>
nnoremap <silent> <C-q>      :q<CR>
"nnoremap b  :buffers<CR>:b

nnoremap <silent> <C-l> :CtrlPFunky<CR>
inoremap <silent> <C-l> <ESC>:CtrlPFunky<CR>

let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_matchtype = 'path'

nnoremap <silent> <C-_> :call NERDComment(0, "toggle")<CR><CR>
vnoremap <silent> <C-_> :call NERDComment(0, "toggle")<CR><CR>
inoremap <silent> <C-_> <C-o>:call NERDComment(0, "toggle")<CR><C-o><CR>

" Go to previous split
" nnoremap <ESC>[1;2D <C-W><C-H>

"map <C-o> <plug>NERDTreeTabsToggle<CR>
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
"map <C-o> :q!<CR>

map <PageUp> <C-u>
map <PageDown> <C-d>

"let g:nerdtree_tabs_open_on_console_startup=1

""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""

"let g:airline_powerline_fonts = 1
let g:airline_powerline_fonts = 1

let g:airline_theme='kalisi'
" let g:airline_theme='term'
" let g:airline_theme='molokai'
" let g:airline_solarized_bg='dark'

let g:airline_enable_branch=1
"let g:airline_mode_map = {
    "\ '__': '-',
    "\ 'n': 'N',
    "\ 'i': 'I',
    "\ 'R': 'R',
    "\ 'c': 'C',
    "\ 'v': 'V',
    "\ 'V': 'V',
    "\ '^V': 'V',
    "\ 's': 'S',
    "\ 'S': 'S',
    "\ '^S': 'S',
    "\ }
let g:airline_mode_map = {
    \ '__': '',
    \ 'n': '',
    \ 'i': '',
    \ 'R': '',
    \ 'c': '',
    \ 'v': '',
    \ 'V': '',
    \ '^V': '',
    \ 's': '',
    \ 'S': '',
    \ '^S': '',
    \ }

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#combined = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_skip_empty_sections = 1

"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''

":AirlineTheme badwolf
":AirlineTheme dark
":AirlineTheme deus

"set laststatus=0

set timeoutlen=0 ttimeoutlen=0

"let g:jedi#completions_command = "<C-Space>"
let g:jedi#completions_command = "<C-p>"
let g:jedi#popup_on_dot = 0
"let g:jedi#auto_initialization = 0
"let g:jedi#use_tabs_not_buffers = 1
let g:jedi#smart_auto_mappings = 0

let g:jedi#goto_command = "<C-M>"

let g:jedi#completions_enabled = 0

set noshowmode
let g:jedi#show_call_signatures = 0
let g:jedi#show_call_signatures_delay = 0

"set wildmode=longest,list,full
set wildmode=longest,list
set wildmenu

" Smart home
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>
nmap <silent> <Esc>OH <Home>
nmap <silent> <Esc>OF <End>
imap <silent> <Esc>OH <C-o><Home>
imap <silent> <Esc>OF <C-o><End>

" Delete words
inoremap <C-h> <C-W>

" Unindent

nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

"imap <silent> <Home> <Esc><Home>i

:set cursorline
:set cursorcolumn

:set fillchars+=vert:│

" CommandT
:let g:CommandTFileScanner = 'git'

" CtrlP
let g:webdevicons_enable_ctrlp = 1
" let g:ctrlp_max_height = 20
let g:ctrlp_match_window = 'bottom,order:ttb,min:16,max:16,results:16'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_map = '<c-k>'
"let g:ctrlp_custom_ignore = {
            "\ 'dir': '\.git$|node_modules$|\.env$',
            "\ 'file': '\.exe$|\.so$|\.pyc$|\.pyo$|__pycache__$'
            "\ }
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules|\.env[236]*|\.cache|\.exe|\.so|\.pyc|\.pyo|__pycache__)'

"let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

"function BrightHighlightOn()
  "hi CursorLine ctermbg=darkred
"endfunction

"function BrightHighlightOff()
  "hi CursorLine ctermbg=235
"endfunction

"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
"    \ 'AcceptSelection("t")': ['<cr>'],
"    \ }

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" Cursor

:hi CursorLine ctermbg=235 " cterm=underline
:hi CursorColumn ctermbg=235
:hi StatusLine ctermfg=233
:hi StatusLineNC ctermfg=233 ctermbg=7
" Molokai theme patches

hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE
hi EndOfBuffer ctermfg=118

filetype plugin on

" Indentation
set tabstop=4 softtabstop=4 shiftwidth=4
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" let g:indent_guides_enable_on_vim_startup=1
let g:indentLine_char = '▏'
" let g:indentLine_char = '┊'
let g:indentLine_first_char = '▏'
" let g:indentLine_first_char = 'x'
" let g:indentLine_char = 'x'
" let g:indentLine_leadingSpaceChar = '·'
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_setColors = 0
let g:indentLine_concealcursor = ''
" let g:indentLine_conceallevel = 1
" let g:indentLine_setConceal = 0
let g:indentLine_color_term = 239
" let g:indentLine_bgcolor_term = 202
let g:indentLine_showFirstIndentLevel = 1

" PyMode
"
"let g:pymode_folding = 0
"let g:pymode_lint = 1
"let g:pymode_python = 'python'

"nnoremap <silent> <F5> :PymodeLint<CR>
"inoremap <silent> <F5> <C-o>:PymodeLint<CR>

"let g:pymode_python = 'python3'
"let g:pymode_rope = 0

" PyFlakes

let g:pyflakes_use_quickfix = 0

" Syntastic

" let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✖︎'
let g:syntastic_style_error_symbol = '✖︎'
let g:syntastic_warning_symbol = '∙∙'
let g:syntastic_style_warning_symbol = '∙∙'
let g:syntastic_always_populate_loc_list = 1

nnoremap <silent> <F5> :w<CR>:SyntasticCheck<CR>
inoremap <silent> <F5> <C-o>:w<CR><C-o>:SyntasticCheck<CR>
nnoremap <silent> <ESC>[1;2A :lprev<CR>
inoremap <silent> <ESC>[1;2A <C-o>:lprev<CR>i
nnoremap <silent> <ESC>[1;2B :lnext<CR>
inoremap <silent> <ESC>[1;2B <C-o>:lnext<CR>i

" Fix cursor positioning on I->N mode switch
" au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

" Conceal

" syn keyword Operator lambda conceal cchar=λ

" Backups

" set backupdir=/tmp
" set directory=/tmp
set noswapfile
set nobackup

" Sudo write
:command SudoW w !sudo tee %

" Clipboard fix
set clipboard=unnamedplus

" Char code

function! CharSegment()
    let char = matchstr(getline('.'), '\%' . col('.') . 'c.')
    "let g:airline_section_z .= ' ' . code
    return printf("0x%04x (%s)", char2nr(char), char)
endfunction

function! Init()
  "call airline#parts#define_function('cwd', 'getcwd')
  "call airline#parts#define_minwidth('cwd', 80) "adjust as necessary, it'll check against windwidth()
  "let g:airline_section_b = airline#section#create(['Buf #[%n] ', 'cwd'])
  "let g:airline_section_z .= '  %{CharSegment()}'
  let g:airline_section_z = '%#__accent_bold#%4l%#__restore__#%#__accent_bold#/%L%#__restore__# %{CharSegment()}'
endfunction

autocmd VimEnter * call Init()

" Error/warning highlights

"hi SpellBad ctermbg=9
"hi SpellCap ctermbg=11

" Interactive bash (with .bashrc)
":set shellcmdflag=-ic

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod =  ':t'

" Prevent cursor from jumping left when leaving insert mode
"inoremap <silent> <Esc> <C-O>:stopinsert<CR>

" Remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

":set noeol
":set nofixeol

"set tabstop=4
"set softtabstop=4
"set shiftwidth=2

" Disable jedi docstring popup
autocmd FileType python setlocal completeopt-=preview

" Allow switching to other buffer if current buffer has unsaved changes
set hidden

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

au VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
au VimEnter * call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
au VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
au VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
au VimEnter * call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
au VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
au VimEnter * call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
au VimEnter * call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

