"{{{ Key Mappings
"Leader key
let mapleader = "\<Space>"


"vnoremap <C-c> "+y
"map <C-v> "+P

"remap leader ; to get to cmd mode
nnoremap <leader>; :

"window movements
"noremap <C-h> <C-w>h
"noremap <C-j> <C-w>j
"noremap <C-k> <C-w>k
"noremap <C-l> <C-w>l
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>



" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-l> :nohlsearch<CR>

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

"This command maps the Esc key to the jj sequence for characters
inoremap jj <Esc>
"This command maps the Esc key in Visual Mode to the tab key
vnoremap <Tab> <Esc>

"This command maps esc key to no operation
"inoremap <esc> <Nop>

"This command maps arrow keys
inoremap <UP> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <UP> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

"map Y to behave as D and C
nnoremap Y y$

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

inoremap <C-S-2> <C-@>

" provide hjkl movements in Command-line mode via the <Alt> modifier key
cnoremap <A-h> <Left>
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
cnoremap <A-l> <Right>

"mapping movements to camelcasemotion movements
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge

"}}}

"{{{--------------UI---------------
" Show syntax highlight
syntax on

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Make searching case insensitive
set ignorecase
" ... unless the query has capital letters.
set smartcase
"Load other files without warning from current file
set hidden

"Immediate feedback for substitution command
set inccommand=split

cd $HOME/Documents

source $HOME\AppData\Local\nvim\plugins.vim

" quicksave manual plugin
"set runtimepath+=~\AppData\Local\nvim\plugged\quicksave\quicksave.vim

" Redraw the screen only when needed. Allows faster macros
set lazyredraw


" Set colorscheme to gruvbox
let g:gruvbox_contrast_light = 'soft'
colorscheme gruvbox


"activate hardtime plugin
let g:hardtime_default_on = 0


"{{{ primagen sets
set guicursor=
set relativenumber
set number
"set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
"for centering top or bot, will show 8 lines above or below
set scrolloff=8
"}}} 

" set noshowmode
" Adds a column on the left to use with symbols
set signcolumn=yes
"characters can appear in filename
set isfname+=@-@
"hide status line
" set ls=0

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
"
set background=dark

"use system clipboard
set clipboard=unnamed
" Show matching brackets.
set showmatch
" Continue comment marker in new lines.
set formatoptions+=o
" Show the line numbers on the left side.
set relativenumber
" Highlight current cursor line
set cursorline
" Continue comment marker in new lines.
set formatoptions+=o
" Insert spaces when TAB is pressed.
set expandtab
" Render TABs using this many spaces.
set tabstop=4
" Indentation amount for < and > commands.
set shiftwidth=4
" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces
" Opens splits below and on the right side
set splitbelow splitright

"}}}

"{{{ Macros
let @g="I'\<Esc>A',\<Esc>j"
let @h="A,\<Esc>j"
"}}}


"{{{ vim remembers conf
let g:remembers_ignore_empty_buffers = 1
let g:remembers_tmp_dir     = '~/nvim/temp'
let g:remembers_session_dir = '~/nvim/sessions'
"}}}

" delete current file
"nnoremap <Leader>d. :call DeleteFileAndCloseBuffer()

fun! DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file and close buffer?", "&Do it!\n&Nonono", 1)
  if choice == 1 | call delete(expand('%:p')) | q! | endif
endfun

"{{{ UltiSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"
"}}}

lua require('settings')

set foldmethod=marker
