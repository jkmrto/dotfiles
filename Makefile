OS = $(shell UNAME)

install: zsh-tools vim-tools go-tools hugo

dev-tools: elixir-ls elm-ls graphql

zsh-tools: autojump

vim-tools: grip htmlhint prettier eslint

go-tools: gofumpt


PWD := $(shell pwd)
update:
	rm -f ${HOME}/.config/nvim/init.vim
	ln ${PWD}/nvim/init.vim  ${HOME}/.config/nvim/init.vim

	rm -f ${HOME}/.zshrc
	ln ${PWD}/zsh/.zshrc  ${HOME}/.zshrc



# Export local config as dotfile, and linkit
link-from-local:
	rm -f zsh/.zshrc;
	cp ${HOME}/.zshrc zsh/.zshrc
	rm -f ${HOME}/.zshrc;
	ln -s zsh/.zshrc ${HOME}/.zshrc

# THis is not needed anynmore
elixir-ls:
	mkdir -p ~/opt
	cd ~/opt; if [ ! -d 'elixir-ls' ]; then git clone https://github.com/JakeBecker/elixir-ls.git; fi
	cd ~/opt/elixir-ls; mix deps.get && mix compile
	cd ~/opt/elixir-ls; mix elixir_ls.release -o rel

elm-ls:
	npm install -g elm-format
	npm install -g @elm-tooling/elm-language-server

# https://github.com/happylinks/gqlint
graphql:
	npm install -g gqlint

autojump:
	(cd; git clone git://github.com/wting/autojump.git)
	(cd ~/autojump; ./install.py)

prettier:
	npm install -g prettier

# https://github.com/joeyespo/grip
grip:
	sudo pip3 install grip

# html linter: https://github.com/htmlhint/HTMLHint
htmlhint:
	npm install -g htmlhint

# Stricter format than gofmt
# https://github.com/mvdan/gofumpt
gofumpt:
	cd $(mktemp -d); go mod init tmp; go get mvdan.cc/gofumpt/gofumports

eslint:
	npm install -g eslint
	npm install -g eslint-config-prettier

hugo:
ifeq ($(OS), Darwin)
	brew install hugo
endif
