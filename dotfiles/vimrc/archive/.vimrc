" My vim configuration of Vim 7.4+ or 8.0+
"
"  Author: xiaming.chen
"  Email: chenxm35@gmail.com
"
" Tested on CentOS 7, Ubuntu 20.04, MacOS X

set nocompatible
filetype off

"++++++++++ Vundle start ++++++++++++++
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" UI
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'

" Editor
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'ctrlpvim/ctrlp.vim'  " Finder
Plugin 'thaerkh/vim-workspace' " Sessions

" Git
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'

" Language servers
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'dense-analysis/ale'

" Semantics
Plugin 'cdelledonne/vim-cmake'
Plugin 'chrisbra/csv.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'rust-lang/rust.vim'
Plugin 'kovisoft/slimv' " for LISP

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
"------------- Vundle end -------------

" -----------
" General
" -----------
let mapleader=","
syntax on
set nocompatible
set autoindent
set autoread
set backspace=2
set cursorline
set encoding=utf-8
set expandtab
set fileencodings=utf-8,ucs-bom,GB2312,big5
set hlsearch
set ignorecase
set nowrap
set number
set ruler
set scrolloff=4
set shiftwidth=4
set showmatch
set smartindent
set softtabstop=0
set tabstop=4

" -----------
" Shortcuts
" -----------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>r :NERDTreeFind<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>e :e#<CR>
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gg :YcmCompleter GoToReferences<CR>
nnoremap <leader>gk :YcmCompleter GetDoc<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR> 
nnoremap <F2> :mksession! ~/vim_session <cr>
nnoremap <F3> :source ~/vim_session <cr>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :Autoformat<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <F10> :set invpaste paste?<CR>
set pastetoggle=<F10>
set showmode
noremap <F11> :set invnumber<CR>
inoremap <F11> <C-O>:set invnumber<CR>

" -----------
" Interface
" -----------
colorscheme dracula

" True colour
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" -----------
" Extensions
" -----------

" auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" vim-autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" nerdtree
let NERDTreeShowLineNumbers=0
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=0
let NERDTreeWinSize=31
let NERDTreeShowBookmarks=0
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ctrlp
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_switch_buffer = 'et'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_root_markers = [
    \ 'pom.xml',
    \ '.p4ignore',
    \ '.python-version',
    \ 'cargo.toml'
    \ ]
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|m2|bzr)$',
    \ }

" ainbow_parentheses.vim
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" vim-workspace
let g:workspace_create_new_tabs = 0
let g:workspace_session_disable_on_args = 1

" YCM
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

" tagbar
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
  \}

" ale
let g:ale_completion_enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'yapf'],
\   'rust': ['rustfmt'],
\}
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'rust': ['rls','cargo','rustc'],
\}

" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
au BufRead,BufNewFile SConstruct set filetype=python
au BufRead,BufNewFile SConscript set filetype=python
au BufWritePre *.py :%s/\s\+$//e

" LISP
let g:slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server)' wait &"
let g:slimv_lisp = 'ros run'
let g:slimv_impl = 'sbcl'

" EOF
