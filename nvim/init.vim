" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
        Plug 'scrooloose/nerdtree'
        Plug 'vim-airline/vim-airline'
	Plug 'scrooloose/syntastic'
        Plug 'vim-airline/vim-airline-themes'
	Plug 'fatih/vim-go'
call plug#end()

:tnoremap <Esc> <C-\><C-n>  "Use Exc to go out of terminal mode
