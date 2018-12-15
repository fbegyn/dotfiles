
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

" Better status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Better newtr
Plug 'tpope/vim-vinegar'

" Sublimes goto feature
Plug 'kien/ctrlp.vim'

" Project drawer
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'

" Seamless vim panes and tmux splits
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'

" Plug 'tpope/vim-obsession'
Plug 'jwilm/i3-vim-focus'

" Distraction free writing
Plug 'junegunn/goyo.vim'

" Limelight
Plug 'junegunn/limelight.vim'

" Best git wrapper ever
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Auto pairing
Plug 'jiangmiao/auto-pairs'

" Pick up where you left
Plug 'farmergreg/vim-lastplace'

" Indentation guids
Plug 'Yggdroot/indentLine'

"" Better Whitespacejkk
Plug 'ntpeters/vim-better-whitespace'"

" deoplete plugin stuff
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Ultisnips
Plug 'sirver/ultisnips'

" Combin/ keypresses
Plug 'kana/vim-arpeggio'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Languages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax checker helper
Plug 'w0rp/ale'

"" Vim Go
Plug 'fatih/vim-go', {'for': ['go'], 'do': ':GoInstallBinaries'}"
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'buoto/gotests-vim',{'for':['go']}
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Rust developement
Plug 'rust-lang/rust.vim',{'for':['rs']}
Plug 'racer-rust/vim-racer',{'for':['rs']}

" Python autocomplete helper
Plug 'davidhalter/jedi-vim', { 'for':'python'}

"" Vim JSON
Plug 'elzr/vim-json'

" HTML helper
Plug 'othree/html5.vim', { 'for':['html','htm'] }

" vhdl things
Plug 'suoto/vim-hdl', {'for':['vhdl','hdl']}

" Ledger file syntax support
Plug 'ledger/vim-ledger',{'for':['journal']}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'

call plug#end()
call arpeggio#load()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Get the defaults that most users want.
"source $VIMRUNTIME/defaults.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" More natural screen splitting
"set splitbelow
set splitright

set mouse=a

set colorcolumn=81

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" vv and vh to generate new faster plits
Arpeggio map sv :vsp<cr>
Arpeggio map sh :sp<cr>

" Some key rebindings
" Block mode is more usefull then visual
nnoremap   v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" Omnicomplete options
set omnifunc=syntaxcomplete#Complete
set shortmess+=c
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Set to auto read when a file is changed from the outside
set autoread
" Auto indent, self explanatory
set autoindent
" Show mode in statusbar
set showmode
" Number sytem for c-a and c-x incrementation/decrementation
set nrformats-=octal
" Rounds to indent to multiples of shiftwidth
set shiftround
" timeout for combination of keys before considered sime key strokes
set ttimeout
set ttimeoutlen=50

" Clipboard settings
set clipboard=unnamedplus

" Disable backward compatability
set nocompatible

" cursorline
"set cursorline

" Automatically write file when making programs
set autowrite

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
Arpeggio map wq :wq<cr>

" Fast exiting
nnoremap <leader>qq :qa!<cr>
nnoremap <leader>q :q!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=3

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" No line wrap
set nowrap

" enable line numbers
set number
set numberwidth=4
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" exit insert mode
inoremap <C-c> <Esc>
Arpeggio inoremap jk <ESC>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
" set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Better search
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" highlight the match in red...
highlight WhiteOnRed ctermbg=red
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#\%('.@/.'\)'
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Netrw settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 10

Arpeggio nnoremap fe :Vex<cr>

map Q gq

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Background color
set background=dark

" Colorscheme
colorscheme PaperColor

" set column border in color
highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn', '\%81v', 100)

" Enable syntax highlighting
syntax on

" Enable better colors
set t_Co=256

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

hi SpellBad ctermfg=none ctermbg=4 guibg=Red

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set titlestring=VIM

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Vimdiff
""""""""""""""""""""""""""""""
nnoremap <leader>dr :diffget RE<cr>
nnoremap <leader>dl :diffget LO<cr>
nnoremap <leader>db :diffget BA<cr>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Disabling the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Smart way to move between windows

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
" set laststatus=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""
" Plugins config
"""""""""""""""""""""""""""""""""""""""""""
" Limelight
"""""""""""""""""""""""""""""""""""""""""""
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"""""""""""""""""""""""""""""""""""""""""""
" VIMUX
"""""""""""""""""""""""""""""""""""""""""""
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

" VIMUX GOLANG
map <Leader>ra :wa<CR> :GolangTestCurrentPackage<CR>
map <Leader>rf :wa<CR> :GolangTestFocused<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" Apreggio
""""""""""""""""""""""""""""""""""""""""""""""
Arpeggio map gs :Gstatus<cr>
Arpeggio map gb :Gblame<cr>
Arpeggio map gc :Gcommit<cr>a
Arpeggio map gd :Gdiff<cr>a

""""""""""""""""""""""""""""""""""""""""""""""""""
"completor
"""""""""""""""""""""""""""""""""""""""""""""""""
"let g:completor_python_binary = '/path/to/python/with/jedi/installed'
let g:completor_racer_binary = '/home/francis/.cargo/bin/racer'
let g:completor_gocode_binary = '/home/francis/Go/bin/gocode'
let g:completor_clang_binary = '/usr/bin/clang'
let g:completor_complete_options = 'menuone,noselect,preview'
let g:completor_tex_omni_trigger =
        \   '\\(?:'
        \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \  .  '|hyperref\s*\[[^]]*'
        \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
        \  .')'

""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\'auto_complete_delay': 50,
\'smart_case': v:true,
\})

"""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

"""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnip
"""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: <f1> otherwise it overrides <tab> forever
" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader>e'
let g:UltiSnipsJumpForwardTrigger='<leader>r'
let g:UltiSnipsJumpBackwardTrigger='<leader>w'

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" Enable completion where available.
let g:ale_completion_enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='one'
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IndentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Golang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_auto_type = 1
let g:go_template_autocreate = 0
let g:go_gocode_unimported_packages = 1
let g:go_bin_path= "/home/francis/Go/bin"

nnoremap <leader>gt :GoTest<cr>
nnoremap <leader>gs :GoFillStruct<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Golang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%{fugitive#statusline()}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>f :Goyo<cr>
let g:goyo_width = 80
let g:goyo_height = 90
let g:goyo_linenr = 1

""""""""""""""""""""""""""""""""""""""""""""""
" Limelight
"""""""""""""""""""""""""""""""""""""""""""""
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

""""""""""""""""""""""""""""""
" hledger
"""""""""""""""""""""""""""""
autocmd FileType hledger setlocal omnifunc=hledger#complete#omnifunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
      call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
      call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" indent / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <

" comment / decomment & normal comment behavior
vmap <C-m> gc

" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}

" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S

" lazy ':'
map \ :

nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diffcolors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight DiffAdd    cterm=bold ctermfg=2 ctermbg=none gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=1 ctermbg=none gui=none guifg=bg guibg=Red
highlight DiffChange cterm=none ctermfg=4 ctermbg=none gui=none guifg=bg guibg=Red
highlight DiffText   cterm=none ctermfg=11 ctermbg=none gui=none guifg=bg guibg=Red

