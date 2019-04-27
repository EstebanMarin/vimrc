"------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------
" __  __     ______                                                   __            _     
"/\ \/\ \   /\__  _\     /'\_/`\                                    /'__`\        /' \    
"\ \ \ \ \  \/_/\ \/    /\      \                                  /\ \/\ \      /\_, \   
" \ \ \ \ \    \ \ \    \ \ \__\ \              _______            \ \ \ \ \     \/_/\ \  
"  \ \ \_/ \    \_\ \__  \ \ \_/\ \            /\______\            \ \ \_\ \ __    \ \ \ 
"   \ `\___/    /\_____\  \ \_\\ \_\           \/______/             \ \____//\_\    \ \_\
"    `\/__/     \/_____/   \/_/ \/_/                                  \/___/ \/_/     \/_/
"
"-------------------------------------------------------------------------------------------
"-------------------------------------------------------------------------------------------
"
" Name: ~./vimrc
"   Sections                                                                                      
"   ----------------------*
"   1.0 General
"   2.0 Vim user interface
"   3.0 Mappings
"   4.0 Text, tabs, indent related
"   6.0 Plug in manager
"
"" ~/.config/nvim/init.vim for neoVim

set nocompatible              " required
filetype off                  " required
filetype plugin on
syntax on
set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=4 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set number              " Show number
set relativenumber      " Set Relative number
set undofile   " Maintain undo history between sessions
set undodir=~/.vim/undodir
set foldenable "Enable folding
set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed.
set foldnestmax=10 "Folds can be nested. Setting a max value protects you from too many folds.
set foldmethod=manual "Defines the type of folding.

""GENERAL MAPPING!!!
"Emmet remaping
let g:user_emmet_leader_key='<C-n>'

""Tabs with Alt + p or + l caveat for mac I need to map directly <ALT+pj> ==> π
map  <Leader>e :tabn<CR>
map  <Leader>r :tabp<CR>

"" Mapping for better terminal usage
if has('nvim')  
    tnoremap \<Esc> <C-\><C-n>  
endif
"" Mapping to have clear last search :noh with Leader
nnoremap <space>, :nohlsearch<CR>

"" Resizing Mapping
nmap <Leader>z <C-e>

" toggle commenting of lines with command + / Mapping 
" <Alt + /> ===> ÷
nmap ÷ :Commentary<CR>
vmap ÷ :Commentary<CR>

" Leader key is like a command prefix. 
let mapleader="\<Space>"
""Using mapleader
nnoremap <Leader>; :w<CR>
"Using Leader for buffers
 vmap <Leader>y "+y
 vmap <Leader>d "+d
 nmap <Leader>p "+p
 nmap <Leader>P "+P
 vmap <Leader>p "+p
 vmap <Leader>P "+P
 
 ""Toggle between windows
 nnoremap <Leader>q <C-w>h
 nnoremap <Leader>w <C-w>l
 nnoremap <Leader>k <C-w>k
 nnoremap <Leader>j <C-w>j
"" Show Next Matched String at the center of the Screen
nnoremap n nzz
nnoremap N Nzz

""Mapping to move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
"" Mapping to move through buffers
 map <Leader>u :bprev<CR>   
 map <Leader>i :bnext<CR>   

"" You complete me options
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


""""fzf confgs
nnoremap <C-p> :<C-u>FZF<CR>

"Number and relative Number
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}
"Airline configurations
let g:airline#extensions#ale#enabled = 1

""ale configurations
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['tsserver'] , 'python':['autopep8'] }
let g:ale_fixers = { 'javascript': ['prettier'], 'typescript': ['prettier'], 'python':['autopep8'] }
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1 
"" happy surprises
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str  = '🔴'
let g:ale_echo_msg_info_str = '💻'
let g:ale_echo_msg_warning_str = '⚠️'


 

" NERDTree configurations 
"Auto open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"End of NerdTree Configurations
"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"TypeScript configurations
""This makes completions slow but shows typescrip types
let g:tsuquyomi_completion_detail = 1
""Integrating with Syntastic
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
""leafGrat indenting problem
let g:typescript_indent_disable = 1
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
""" light blue
hi tsxTagName guifg=#59ACE5
" dark blue
hi tsxCloseString guifg=#2974a1
hi tsxCloseTag guifg=#2974a1
hi tsxAttributeBraces guifg=#2974a1
hi tsxEqual guifg=#2974a1
" green
hi tsxAttrib guifg=#1BD1C1
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
"YouCompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

" Treat mdx as md
autocmd BufNewFile,BufRead *.mdx set syntax=markdown

let g:python_host_prog="/usr/local/bin/python2.7"

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1
""https://github.com/neovim/neovim/issues/3702 Copy and paste issue
set mouse=a



call plug#begin('~/.config/nvim/plugged')
"" Vim Auto pair plugin
Plug 'tmsvg/pear-tree'
""Vim Game
Plug 'johngrib/vim-game-code-break'
""Vim Commentary
Plug 'tpope/vim-commentary'
"Vim surround 
Plug 'tpope/vim-surround'
"Git Wrapper
Plug 'tpope/vim-fugitive'
""Completion
Plug 'Valloric/YouCompleteMe'
""fzf vim for searching files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"JavaScript Intendint
Plug 'pangloss/vim-javascript'
"Linting for Javascript
Plug 'w0rp/ale'
"JSX Formating
Plug 'mxw/vim-jsx'
"Emmet
Plug 'mattn/emmet-vim'
"NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
""TypeScript
Plug 'quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"AIRLINE
Plug 'bling/vim-airline'
"Multiple Cursors
Plug 'terryma/vim-multiple-cursors'
"" Solarized
Plug 'altercation/vim-colors-solarized'
""WinResize
Plug 'simeji/winresizer'
""Grammar correction 
Plug 'rhysd/vim-grammarous'
call plug#end()


"""Solarized Theme configurations
" Make sure for iTerm2 the Solarized theme is active too. 
" info for configuration https://www.youtube.com/watch?v=zNcEkbVYqbc
colorscheme solarized
set background=dark
