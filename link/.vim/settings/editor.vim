" General Vim settings

" Create vimrc autocmd group and remove any existing vimrc autocmds,
" in case .vimrc is re-sourced.
augroup vimrc
  autocmd!
augroup END

" Change vim's weird split defaults
set splitbelow
set splitright

" Visual settings
set number " Enable line numbers.
set showtabline=2 " Always show tab bar.
set relativenumber " Use relative line numbers. Current line is still in status bar.
set title " Show the filename in the window titlebar.
set nowrap " Do not wrap lines.
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set laststatus=2 " Always show status line
set tabstop=4 " Set tab size
set expandtab " Use spaces instead of tabs
syntax on
" Indentation
set autoindent " Copy indent from last line when starting new line.
set shiftwidth=4 " The # of spaces for indenting.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=4 " Tab key results in 2 spaces
colorscheme default " Use default colouscheme
" Highlight current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
" Indicate too many chars/line
let colorcolumn=81
" Make invisible chars less visible in terminal.
autocmd vimrc ColorScheme * :hi NonText ctermfg=236
autocmd vimrc ColorScheme * :hi SpecialKey ctermfg=236
" Show trailing whitespace.
autocmd vimrc ColorScheme * :hi ExtraWhitespace ctermbg=red guibg=red
" Make selection more visible.
autocmd vimrc ColorScheme * :hi Visual guibg=#00588A
autocmd vimrc ColorScheme * :hi link multiple_cursors_cursor Search
autocmd vimrc ColorScheme * :hi link multiple_cursors_visual Visual

" Search / replace
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set ignorecase " Ignore case of searches.
set smartcase " Ignore 'ignorecase' if search pattern contains uppercase characters.

" Cache directories
set backupdir=~/.dotfiles/caches/vim
set directory=~/.dotfiles/caches/vim
set undodir=~/.dotfiles/caches/vim

" Show absolute numbers in insert mode, otherwise relative line numbers.
autocmd vimrc InsertEnter * :set norelativenumber
autocmd vimrc InsertLeave * :set relativenumber

" Vim commands
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set report=0 " Show all changes.
set mouse=a " Enable mouse in all modes.
set shortmess+=I " Hide intro menu.

" Scrolling
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline settings
let g:airline_extensions = []

" Vim-tmux-navigator settings
let g:tmux_navigator_save_on_switch = 2 " Write all buffers before navigating from Vim to tmux pane
