syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hlsearch "highlight search results
set expandtab " turn tabs into spaces
set autoindent

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

hi Search cterm=NONE ctermfg=black ctermbg=yellow

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR>

colorscheme slate

"F2 and F3 to move to next/previous buffer
map <F2> :bprev<CR>
map <F3> :bnext<CR>
