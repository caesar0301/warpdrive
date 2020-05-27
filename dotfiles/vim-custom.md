### Vim
```
# Install vim against python3 (vi --version)
https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source#3-once-everything-is-installed-getting-the-source-is-easy
```

### Python
```
# Ubuntu
pip3 install --user autopep8 flake8 jedi yapf pylint

" Vundle
Plugin 'python-mode/python-mode'
Plugin 'dense-analysis/ale'
Plugin 'davidhalter/jedi-vim'

" ale
let g:ale_completion_enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'yapf'],
\}
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\}

" jedi-vim
let g:jedi#goto_command = "<leader>gd"
let g:jedi#goto_assignments_command = "<leader>gg"
let g:jedi#goto_stubs_command = "<leader>gs"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>gk"
let g:jedi#usages_command = "<leader>gu"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>gr"

" Misc
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
```

### Rust
```
# Ubuntu
rustup toolchain add nightly
cargo +nightly install racer
rustup component add rls-preview rust-analysis rust-src --toolchain nightly
sudo apt install ctags

" Vundle
Plugin 'rust-lang/rust.vim'
Plugin 'majutsushi/tagbar'

" tagbar
nnoremap <F8> :TagbarToggle<CR>
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
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_linters = {'rust': ['rls','cargo','rustc']}
```

### GO
```
# Ubuntu
go get -u github.com/jstemmer/gotags
go get -u golang.org/x/tools/cmd/gopls

" Vundle
Plugin 'fatih/vim-go'

" tagbar
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
```

### YCM
```
# Ubuntu
sudo apt install build-essential cmake python3-dev
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
python3 install.py --go-completer --rust-completer --java-completer

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
```
