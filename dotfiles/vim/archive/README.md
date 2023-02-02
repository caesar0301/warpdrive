# HowTo

## Vim

### Vundle
```bash
cp .vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
* More extensions see [vim-custom.md](https://github.com/caesar0301/warp-drive/blob/master/dotfiles/vim-custom.md)

**Shortcuts**
```bash
let mapleader=","
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
```

* [NerdTree shortcuts](https://gist.github.com/ifels/e0a6d79ee60e113f4294)

### SpaceVim (optional)
```bash
curl -sLf https://spacevim.org/install.sh | bash
mkdir ~/.SpaceVim.d/
cp init.toml ~/.SpaceVim.d/
```

Dependencies by lsp and others:
* Java JDT: https://download.eclipse.org/jdtls/snapshots/?d
* Python lsp: `pip install python-language-server`
* Clangd on CentOS
```bash
sudo yum install epel-release
sudo yum install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install clangd --classic
export PATH=/snap/bin:$PATH
```
## References:
* https://blogs.technet.microsoft.com/jessicadeen/linux/macos-ohmyzsh-tmux-vim-iterm2-powerlevel9k-badass-terminal/
* How to tabularize texts, see more https://github.com/godlygeek/tabular
* How to use tabular auto completion, see https://github.com/ervandew/supertab
* code formatter, see more https://github.com/Chiel92/vim-autoformat
