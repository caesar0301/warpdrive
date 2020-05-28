### Vim
```
# Install vim against python3 (vi --version)
https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source#3-once-everything-is-installed-getting-the-source-is-easy
```

### Programming (common)

#### YCM (For python/rust/cpp/go/java)
```
# Ubuntu
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
# For python2: git checkout legacy-py2
git submodule update --init --recursive
python3 install.py --rust-completer --java-completer

" YouCompleteMe
Plugin 'ycm-core/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gg :YcmCompleter GoToReferences<CR>
nnoremap <leader>gk :YcmCompleter GetDoc<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR> 
```

#### Ctags (rust/go)
```
sudo apt install ctags

Plugin 'majutsushi/tagbar'
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
```

#### ALE (python/rust)
```
# Ubuntu
pip3 install --user autopep8 flake8 jedi yapf pylint

Plugin 'dense-analysis/ale'

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
```

### Programming (Specific)
#### Python
```
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

" Vundle
Plugin 'rust-lang/rust.vim'
```
