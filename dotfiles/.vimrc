set nocompatible              " required
filetype off                  " required
let mapleader=","
set pastetoggle=<F10>
syntax on
set ic
set nu
set hlsearch
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5
set autoindent
set smartindent
set scrolloff=4
set showmatch
set autoread

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Autocompletion
Plugin 'ycm-core/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
" Disable TAB trigger
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
" Select with Enter 
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_min_num_of_chars_for_completion=2
" Go to definition ALT + g
" nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>  

" Auto completion for pairs
"Plugin 'jiangmiao/auto-pairs'
"let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutBackInsert = '<M-b>'

" Auto code formatter 
Plugin 'Chiel92/vim-autoformat'
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
nnoremap <F6> :Autoformat<CR>

" Status bar enhancement
Plugin 'bling/vim-airline'

" File browser NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=31
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1 
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap  <C-l> :tabn<CR>
nnoremap  <C-h> :tabp<CR>
"nnoremap  <C-n> :tabnew<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Awesome CtrlP fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = [
    \ 'pom.xml', 
    \ '.p4ignore',
    \ '.python-version',
    \ 'cargo.toml'
    \ ]
let g:ctrlp_switch_buffer = 'et'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Syntax checking
Plugin 'w0rp/ale'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let b:ale_linters = {'rust': ['rls','cargo','rustc']}
let g:ale_fixers = {'rust': ['rustfmt']}
nmap <leader>d :ALEGoToDefinitionInSplit<CR>
nmap <leader>g :ALEFindReferences<CR>

" Auto completion for Python
Plugin 'davidhalter/jedi-vim'
let g:jedi#completions_enabled = 1
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_splits_not_buffers = "winwidth"
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" Rust
Plugin 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
let g:vim_markdown_folding_disabled = 1
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_autoscroll = 0

" Colorful parentheses
Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [ ['brown',       'RoyalBlue3'],
                        \ ['Darkblue',    'SeaGreen3'],
                        \ ['darkgray',    'DarkOrchid3'],
                        \ ['darkgreen',   'firebrick3'],
                        \ ['darkcyan',    'RoyalBlue3'],
                        \ ['darkred',     'SeaGreen3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['brown',       'firebrick3'],
                        \ ['gray',        'RoyalBlue3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
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

" Theme Dracula
Plugin 'dracula/vim', { 'name': 'dracula' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"*******************************************
" Put your non-Plugin stuff after this line
"*******************************************

" General settings
"colorscheme dracula

" Filetype
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
au BufNewFile,BufRead *.js,*.html,*.css
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |

" Keymap
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

