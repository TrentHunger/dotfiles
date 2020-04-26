#!/usr/bin/env make

OS = $(shell uname -s)

.PHONY: all
all: bin dotfiles


.PHONY: dotfiles
dotfiles:
	for file in $(shell find $(CURDIR) -maxdepth 1 -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".github" -not -name ".gnupg" -not -name ".DS_Store" -not -name ".i3"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done;

	ln -sfn $(CURDIR)/gitignore $(HOME)/.gitignore
	ln -sfn $(CURDIR)/bin $(HOME)/.bin

	if [[ -d $(HOME)/Library/Application\ Support/Code/User/ ]]; then \
        ln -sfn $(CURDIR)/settings.json $(HOME)/Library/Application\ Support/Code/User/settings.json; \
	elif [[ -d "$(HOME)/.config/Code/User/" ]]; then \
        ln -sfn $(CURDIR)/settings.json $(HOME)/.config/Code/User/settings.json; \
	fi

	git clone -b master --single-branch https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	git clone -b master --single-branch https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe/
	cd '$(HOME)/.vim/bundle/YouCompleteMe/'; \
	git submodule update --init --recursive;
	~/.vim/bundle/YouCompleteMe/install.py --clang-completer;

    ifneq ($(OS), Darwin)
		ln -sfn $(CURDIR)/.i3/config $(HOME)/.config/i3/
		ln -sfn $(CURDIR)/.i3/i3status.conf /usr/local/etc/
    endif


.PHONY: bin
bin:
	@echo BIN


.PHONY: clean
clean:
	rm ~/.gitconfig ~/.vimrc
