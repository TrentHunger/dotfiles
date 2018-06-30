#!/usr/bin/make

SHELL = /bin/sh
OS = $(shell uname -s)

.PHONY: all
all: dotfiles bin


dotfiles:
ifeq ($(OS), Darwin)
endif
ifeq ($(OS), FreeBSD)
		cp ./i3/config ~/.config/i3/
		cp ./i3/i3status.conf /usr/local/etc/
endif
ifeq ($(OS), Linux)
endif
	cp {./git/.gitconfig,./irssi/.irssi,./tmux/.tmux.conf,./vim/.vimrc} ~/


bin:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	~/.vim/bundle/YouCompleteMe/install.py --clang-completer


.PHONY: clean
clean:
	# clean here

