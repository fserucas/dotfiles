colorscheme desert
set ruler
set nocompatible
set hlsearch
set visualbell

" # Vim Plug - To install Plugins
""   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
""     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
"" The default plugin directory will be as follows:
""   - Vim (Linux/macOS): '~/.vim/plugged'
""   - Vim (Windows): '~/vimfiles/plugged'
""   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
"" You can specify a custom plugin directory by passing it as the argument
""   - e.g. `call plug#begin('~/.vim/plugged')`
""   - Avoid using standard Vim directory names like 'plugin'
"
"" Make sure you use single quotes
"
"" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
"
"" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"
"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
"
"Plug 'vim-airline/vim-airline'
"Plug 'scrooloose/nerdtree'
"Plug 'valloric/youcompleteme'
"
"" Initialize plugin system
"call plug#end()

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'

Plug 'vmchale/dhall-vim'
Plug 'elzr/vim-json'
Plug 'xadillax/json-formatter.vim'
Plug 'vim-airline/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'wincent/command-t'
Plug 'junegunn/fzf.vim'
" Lsp server
Plug 'autozimu/LanguageClient-neovim', {
	    \ 'branch': 'next',
	        \ 'do': 'bash install.sh',
		    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'rrethy/vim-illuminate'
Plug 'liuchengxu/vista.vim'
Plug 'w0rp/ale'
" Create Directory if it does not exis ex: edit /tmp/dir1/dir2/text.txt
Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'

Plug 'ekalinin/dockerfile.vim'
Plug 'wting/rust.vim'

" To install Coc https://github.com/neoclide/coc.nvim
" curl -sL install-node.vercel.app/lts | bash
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree'

Plug 'ervandew/supertab'

call plug#end()
