" Elixir-ls linter setup
function! InstallElixirLs()
	if isdirectory('.elixir_ls') | execute("!rm -rf .elixir_ls") | endif
	execute("!git clone https://github.com/JakeBecker/elixir-ls.git .elixir_ls")
	execute("!cd .elixir_ls; mix deps.get; mix compile")
	execute("!cd .elixir_ls; mix elixir_ls.release -o rel")
endfunction

if filereadable("mix.exs")
	echo "mix.exs found. Checking elixir_ls is available"
	if !isdirectory('.elixir_ls')
		echo "ElixirLs will be installed"
		call InstallElixirLs()
	else
		echo "ElixirLs is available"
	endif
endif

echo "Elixirls autoinstall loaded"
