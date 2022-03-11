"  _   __(_)__ ___  __________
" | | / / / __ `__ \/ ___/ ___/
" | |/ / / / / / / / /  / /__
" |___/_/_/ /_/ /_/_/   \___/

" Basics

        let mapleader=" "
        set nocompatible
        filetype plugin on
        filetype plugin indent on
        syntax on
        set encoding=utf-8 fileencodings=
        set number relativenumber

" Error column on the right
        set signcolumn=yes

" Line never to exceed
        set colorcolumn=80

" No annoying swap file
        set noswapfile

" Incremental search
        set incsearch

" Erase highlight when search is done
        set nohlsearch

" set tab size
        set tabstop=4
        set shiftwidth=4
        set expandtab

" Display unprintable chars f12
        set list
        set listchars=tab:⇒\ ,trail:•,extends:»,precedes:«

" Disable automatic commenting on new line
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set spellcheck to SP o (orthography) + n (English)
        map <leader>o :setlocal spell! spelllang=en <CR>

" Format C code
        map <leader>f gg=G

" Splits at the bottom and right
        set splitbelow splitright

" Shortcutting split navigation
        map <C-j> <C-w>h
        map <C-k> <C-w>j
        map <C-i> <C-w>k
        map <C-l> <C-w>l

" Ensure files are read as they should
        let g:vimwiki_ext2syntax={'.Rmd': 'markdown', '.rmd': 'markdown', '.md': 'markdown', '.markdown': "markdown", '.mdown': 'markdown'}
        autocmd BufRead,BufNewFile /tmp/calcurse*.,~/.calcurse/notes/* set filetype=markdown
        autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
        autocmd BufRead,BufNewFile *.tex set filetype=tex
        autocmd Filetype make setlocal noexpandtab

" NERDtree
        map <leader>n :NERDTreeToggle<CR>

" Remap Fzf :
        nnoremap <silent> <s-f> :Files<CR>
        nnoremap <silent> <C-f> :Rg<CR>

" Plugin

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Deoplete install
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

" TabNine for Deoplete
if has('win32') || has('win64')
  Plugin 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
  Plugin 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif

" Git Wrapper
Plugin 'tpope/vim-fugitive'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Best file explorer for vim
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Plugins for clang format
Plugin 'cjuniet/clang-format.vim'
Plugin 'kana/vim-operator-user'

" Auto close
Plugin 'jiangmiao/auto-pairs'

" Fuzzy finder
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Bar at the bottom of the editor, so handful
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Syntax checking and semantic error
Plugin 'dense-analysis/ale'

" color schemes
Plugin 'ayu-theme/ayu-vim'

" https://github.com/tpope/vim-sensible
Plugin 'tpope/vim-sensible'

call vundle#end()

" Plugin Variables
runtime! plugin/sensible.vim
let g:airline_powerline_fonts = 1
let g:snipMate = { 'snippet_version' : 1 }

" Colorscheme
        set t_Co=256
        set termguicolors

        " ayu
                 let ayucolor="dark"
                 colorscheme ayu

        " challenger-deep
                " colorscheme challenger_deep

        " deus
                " set background=dark
                " colorscheme deus
                " let g:deus_termcolors=256

        " rigel
                " colorscheme rigel

        " gruvbox
                " set background=dark
                " colorscheme gruvbox
                " let g:gruvbox_contrast_dark = 'medium'

        " solarized
                " set background=dark
                " colorscheme solarized
        " material ocean
                "set background=dark
                "let g:material_style='oceanic'
                "colorscheme vim-material

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif

" Functions

fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
endfun

fun! TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

augroup ANDRE
        autocmd!
        autocmd BufWritePre * :call TrimWhitespace()
        autocmd BufWritePre * :call TrimEndLines()
augroup END_
