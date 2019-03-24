" Plugins
" => vim-plug
"''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
call plug#begin('~/.vim/plugged')
" Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

" IDE
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'jwilm/i3-vim-focus'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sirver/ultisnips'
Plug 'ervandew/supertab'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'benmills/vimux'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'
""if has('nvim')
""  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
""else
""  Plug 'Shougo/deoplete.nvim'
""  Plug 'roxma/nvim-yarp'
""  Plug 'roxma/vim-hug-neovim-rpc'
""endif
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-ultisnips'
Plug 'roxma/nvim-yarp'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Helpers
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'w0rp/ale'

" Theme
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'NLKNguyen/papercolor-theme'

" Languages
Plug 'fatih/vim-go', {'for': ['go'], 'do': ':GoInstallBinaries'}
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'benmills/vimux-golang'
Plug 'buoto/gotests-vim',{'for':['go']}
Plug 'rust-lang/rust.vim',{'for':['rs']}
Plug 'stevearc/vim-arduino', { 'for': 'ino' }
Plug 'davidhalter/jedi-vim', { 'for':'python'}
Plug 'pangloss/vim-javascript',{ 'for' : ['js']}
Plug 'elzr/vim-json',{ 'for' : ['json']}
Plug 'othree/html5.vim', { 'for':['html','htm'] }
Plug 'suoto/vim-hdl', {'for':['vhdl','hdl']}
Plug 'ledger/vim-ledger',{'for':['journal']}
Plug 'lervag/vimtex',{'for':['latex','tex']}
call plug#end()

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let g:mapleader = ','

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

set history=500
set showmode
set lazyredraw
set hidden
set noswapfile
set autoread
set ignorecase
set smartcase
set magic
set showmatch
set nobackup
set nowritebackup
set noerrorbells
set updatetime=250
set smartindent "Smart indent

" Linebreak on 111 characters
set textwidth=106
set colorcolumn=105
set linebreak
set wrap "Wrap lines

set number
set numberwidth=2
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set splitright
set splitbelow
set mouse=a

set fileformat=unix
set whichwrap+=<,>,h,l
set wildignore+=.*,.git,*.swp,*pyc,*pyo,*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.jar,*.zip,*.gem,log/**,tmp/**,coverage/**,rdoc/**,output_*,*.xpi,doc/**

" Autcompletion
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
set shortmess+=c

" Enable filetype plugins
filetype plugin on
filetype indent on

" Some key rebindings
" Block mode is more usefull then visual
nnoremap   v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" Number sytem for c-a and c-x incrementation/decrementation
set nrformats-=octal

" Rounds to indent to multiples of shiftwidth
set shiftround
set shiftwidth=2
set tabstop=2
" Use spaces instead of tabs
set expandtab

" timeout for combination of keys before considered sime key strokes
set ttimeout
set ttimeoutlen=60

" Fast saving
nmap <leader>w :w!<cr>
" Fast exiting
nnoremap <leader>qq :qa!<cr>
nnoremap <leader>q :q!<cr>
" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" exit insert mode
inoremap <C-c> <Esc>

" Set x lines to the cursor - when moving vertically using j/k
set scrolloff=4

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Makes search act like search in modern browsers
set incsearch

" No annoying sound on errors
set novisualbell
set t_vb=
set timeoutlen=500

" => Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 12

" Enable syntax highlighting
syntax on
" Enable better colors
set t_Co=256
" Set extra options when running in GUI mode
if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" => Vimdiff
nnoremap <leader>dr :diffget RE<cr>
nnoremap <leader>dl :diffget LO<cr>
nnoremap <leader>db :diffget BA<cr>

" => Visual mode related
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" => Moving around, tabs, windows and buffers
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
map <C-j>     <C-W>j
map <C-k>     <C-W>k
map <C-h>     <C-W>h
map <C-l>     <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>j :bnext<cr>
map <leader>k :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprevious<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
augroup tabLeave
  au TabLeave * let g:lasttab = tabpagenr()
augroup end
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" => Editing mappings
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" => Spell checking
set spelllang=nl,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Plugins config
" VIMUX
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

" \ 'go' : ['/home/francis/Go/bin/go-langserver','-gocodecompletion','-func-snippet-enabled', 'false'],
" Language server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_hasSnippetSupport = 0
let g:LanguageClient_hoverPreview = 'Never'
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'php': ['/usr/bin/php-language-server'],
    \ 'go' : ['/home/francis/Go/bin/gopls','serve'],
    \ 'html' : ['/usr/lib/node_modules/vscode-html-languageserver-bin/htmlServerMain.js','--stdio'],
    \ 'css' : ['/usr/lib/node_modules/vscode-css-languageserver-bin/cssServerMain.js','--stdio'],
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'json' : ['/usr/lib/node_modules/vscode-json-languageserver-bin/jsonServerMain.js','--stdio'],
    \ 'javascript': ['/usr/bin/javascript-typescript-stdio'],
\}
nnoremap <F7> :call LanguageClient_contextMenu()<CR>
noremap <leader>rn :call LanguageClient#textDocument_rename()<CR>
call ncm2#override_source('LanguageClient_python', {'enable': 0})

let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" => goyo
nnoremap <leader>f :Goyo<cr>
let g:goyo_width = 100
let g:goyo_height = 100
let g:goyo_linenr = 1

augroup Goyo
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup end

" Deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_delay = 500

let g:AutoPairsMapCR=0
let g:SuperTabDefaultCompletionType = '<c-n>'

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" ale
let g:ale_linters_explicit = 1
" Enable completion where available.
let g:ale_completion_enabled = 0

" => IndentLine
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

" => Golang
let g:go_fmt_command = 'goimports'
let g:go_auto_type = 1
let g:go_template_autocreate = 0
let g:go_gocode_unimported_packages = 1
let g:go_bin_path= '/home/francis/Go/bin'

augroup golang
  autocmd FileType go nnoremap <leader>gt :GoTest<cr>
  autocmd FileType go nnoremap <leader>gs :GoFillStruct<cr>
  autocmd FileType go nnoremap <leader>gf :GoFmt
augroup end

" => Rust
augroup rustfmt
  autocmd FileType rust,rs cnoreabbrev ff :%! rustfmt<cr>
  autocmd FileType rust,rs cnoreabbrev fs :!rustfmt<cr>
augroup end

" javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" => Git
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set signcolumn=yes

" => airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" hledger
" => Helper functions
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Basic shortcuts definitions
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}

nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>

" Color scheme
" Background color
set background=dark
" Colorscheme
colorscheme PaperColor

" Spelling color
highlight SpellBad cterm=underline ctermbg=130
" Diffcolors
highlight DiffAdd    cterm=bold ctermfg=2 ctermbg=none gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=1 ctermbg=none gui=none guifg=bg guibg=Red
highlight DiffChange cterm=none ctermfg=4 ctermbg=none gui=none guifg=bg guibg=Red
highlight DiffText   cterm=none ctermfg=11 ctermbg=none gui=none guifg=bg guibg=Red


" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" Snippets
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

set rtp+=./

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<tab>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" NCM2 with latex
au Filetype tex call ncm2#register_source({
        \ 'name' : 'vimtex-cmds',
        \ 'priority': 8,
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'prefix', 'key': 'word'},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
    au Filetype tex call ncm2#register_source({
        \ 'name' : 'vimtex-labels',
        \ 'priority': 8,
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'combine',
        \             'matchers': [
        \               {'name': 'substr', 'key': 'word'},
        \               {'name': 'substr', 'key': 'menu'},
        \             ]},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#labels,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
    au Filetype tex call ncm2#register_source({
        \ 'name' : 'vimtex-files',
        \ 'priority': 8,
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'combine',
        \             'matchers': [
        \               {'name': 'abbrfuzzy', 'key': 'word'},
        \               {'name': 'abbrfuzzy', 'key': 'abbr'},
        \             ]},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#files,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
    au Filetype tex call ncm2#register_source({
        \ 'name' : 'bibtex',
        \ 'priority': 8,
        \ 'complete_length': -1,
        \ 'scope': ['tex'],
        \ 'matcher': {'name': 'combine',
        \             'matchers': [
        \               {'name': 'prefix', 'key': 'word'},
        \               {'name': 'abbrfuzzy', 'key': 'abbr'},
        \               {'name': 'abbrfuzzy', 'key': 'menu'},
        \             ]},
        \ 'word_pattern': '\w+',
        \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
        \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
        \ })
