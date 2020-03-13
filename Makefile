elixir-ls:
	mkdir -p ~/opt
	cd ~/opt; if [ ! -d 'elixir-ls' ]; then git clone https://github.com/JakeBecker/elixir-ls.git; fi
	cd ~/opt/elixir-ls; mix deps.get && mix compile
	cd ~/opt/elixir-ls; mix elixir_ls.release -o rel
