" Better safe than sorry
set nocompatible


" Autocompletion
set wildmenu
set wildmode=list:longest,full


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Select with shift arrow
" Activate visual mode in normal mode
nmap <S-Up> V
nmap <S-Down> V
nmap <S-Right> v
nmap <S-Left> v
" these are mapped in visual mode
vmap <S-Up> k
vmap <S-Down> j
vmap <S-Right> l
vmap <S-Left> h


" Better indent
vnoremap < <gv
vnoremap > >gv


" map sort function to a key
map <Leader>s :sort<CR>


" Color scheme
colorscheme evening
set background=dark


" Encoding
set encoding=utf-8


" Tab length
set tabstop=4


" Linux
if MySys() == "linux"
  set guifont=DejaVu\ Sans\ Mono\ 10
endif


" Mac Mini
if MySys() == "mac"
  set guifont=PT\ Mono:h14
endif


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
if MySys() != "windows"
   filetype plugin indent on  " Questa riga spacca tutto su Windows
endif
syntax on


" Easier formatting
vmap Q gq
nmap Q gqap


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80,120
highlight ColorColumn ctermbg=233


set cursorline      " show a visual line under the cursor's current line
set showmatch       " show the matching part of the pair for [] {} and ()
set ruler           " displays the cursor’s current column and line number


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Useful settings
set history=999
set undolevels=999


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
"set noswapfile " Keep this for locking


" Insert pdb
map <Leader>p :call InsertLine()<CR>
function! InsertLine()
  let trace = expand("import pdb; pdb.set_trace()\n")
  execute "normal i".trace
endfunction


""Trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\(\s\+$\)\|\(\t\)/


"" vundle
" set the runtime path to include vundle and initialize
set rtp+=~/Dropbox/Gvim/bundle/Vundle.vim
call vundle#begin('~/Dropbox/Gvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Trova i file con <C>p
Plugin 'ctrlpvim/ctrlp.vim'

" Autocompletion
Plugin 'davidhalter/jedi-vim'

" improved Python folding
Plugin 'tmhedberg/SimpylFold'

" Vim-powerline
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'

" Python mode
"Plugin 'klen/python-mode'

" Syntastic is a syntax checking plugin for Vim that runs files through
" external syntax checkers and displays any resulting errors to the user.
Plugin 'vim-syntastic/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"https://pycodestyle.readthedocs.io/en/latest/intro.html#error-codes
let g:syntastic_python_flake8_args='--ignore=E501'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" PLUGINS VARIABLES {{{
"
" #### SIMPLYFOLD #### {{{
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_import = 0
let g:SimpylFold_fold_docstring = 0

autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

set foldlevelstart=20
set foldmethod=indent
" ########## }}}

" #### POWERLINE #### {{{
set laststatus=2
set t_Co=256
" ########## }}}

" #### CTRLP #### {{{
" Ctrl-P ignore files
set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Ignore using git or hg. Based on this answer 
" http://superuser.com/questions/649714/can-i-get-the-vim-ctrlp-plugin-to-ignore-specific-folder-in-one-project
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
" ########## }}}


" #### JEDI #### {{{
" You can make jedi-vim use tabs when going to a definition
let g:jedi#use_tabs_not_buffers = 1
" ########## }}}


" VIRTUALENV Support
"
"Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif


