OS = $(shell UNAME)

install: dev-tools zsh-tools vim-tools hugo

dev-tools: elixir-ls elm-ls graphql

zsh-tools: autojump

go-tools: gofumpt

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

# https://github.com/joeyespo/grip
grip:
	sudo pip3 install grip

# Stricter format than gofmt
# https://github.com/mvdan/gofumpt
gofumpt:
	cd $(mktemp -d); go mod init tmp; go get mvdan.cc/gofumpt/gofumports

hugo:
ifeq ($(OS), Darwin)
	brew install hugo
endif
