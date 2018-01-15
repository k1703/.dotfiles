" Mappings

" Change mapleader
let mapleader=","
let maplocalleader="\\"

" Substitute ctrl+w then ctrl+j with ctrl+j, etc...
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Clear last search
map <silent> <leader>/ <Esc>:nohlsearch<CR>

" Source .vimrc
nnoremap <leader>r :source $MYVIMRC<cr>

" Strip white space
noremap <leader>ss :call StripExtraWhiteSpace()<CR>

" Read pdf in vim
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" Mappings for vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-B> :TmuxNavigatePrevious<cr>

" Mappings for tagbar
nnoremap <F8> :TagbarToggle<CR>

" Mappings for Hacker News
command! -nargs=1 Hn HackerNews <f-args><CR>
nnoremap <F10> :tab sp <bar> :HackerNews<CR>

" Mappings for vimux
nnoremap <F2> :VimuxPromptCommand<CR>
nnoremap <leader><F2> :VimuxRunLastCommand<CR>
