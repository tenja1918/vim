# vim

my vim settings.

## vim-plug

https://github.com/junegunn/vim-plug

```
mkdir -p ~/.vim/autoload
cd ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

`:PlugInstall` on vim.

## molokai_dark

https://github.com/fcevado/molokai_dark

```
mkdir -p ~/.vim/colors
cd /tmp
git clone https://github.com/fcevado/molokai_dark.git
cp -p molokai_dark/colors/molokai_dark.vim ~/.vim/colors
```

