install: dev-tools zsh-tools vim-tools


dev-tools: elixir-ls elm-ls graphql

zsh-tools: autojump

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

