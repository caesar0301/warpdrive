### Custom

```bash
# Install vim against python3 (vi --version)
https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source#3-once-everything-is-installed-getting-the-source-is-easy

# Install YCM
sudo apt install build-essential cmake python3-dev
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
python3 install.py --go-completer --rust-completer --java-completer

# Python
sudo pip3 install autopep8 flake8 jedi

# Markdown instance preview
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt install nodejs
sudo npm -g install instant-markdown-d

# Rust
rustup toolchain add nightly
cargo +nightly install racer
rustup component add rls-preview rust-analysis rust-src --toolchain nightly

# Go
sudo apt install ctags
go get -u github.com/jstemmer/gotags
go get -u golang.org/x/tools/cmd/gopls

# Latex
sudo apt install pandoc texlive-full
```
.vimrc
```
" Autocompletion
Plugin 'ycm-core/YouCompleteMe'
set completeopt-=preview 
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<TAB>', 'Down']
let g:ycm_key_list_previous_completion = ['<c-p>', '<S-TAB>', 'Up']
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_min_num_of_chars_for_completion=3
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>  

" Show file structure
Plugin 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
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
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" Syntax checking
Plugin 'w0rp/ale'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let b:ale_linters = {'rust': ['rls','cargo','rustc']}
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_linters = {'go': ['gometalinter', 'gofmt']}
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
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
let g:instant_markdown_mathjax = 0
let g:instant_markdown_autoscroll = 1

" Jsonnet
Plugin 'google/vim-jsonnet'

" Git
Plugin 'airblade/vim-gitgutter'

" Go
Plugin 'fatih/vim-go'

" Latex
Plugin 'lervag/vimtex'
let g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
let g:tex_flavor='latex'
let g:vimtex_view_method='general'
let g:vimtex_view_general_viewer='evince'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Jenkinsfile/Groovy
Plugin 'martinda/Jenkinsfile-vim-syntax'

" Status bar enhancement
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"let g:airline_theme='simple'

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
```
