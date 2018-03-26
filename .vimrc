" Truecolor 
"====================================================================
set termguicolors                    " Enable GUI colors for the terminal to get truecolor
set t_8f=[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=[48;2;%lu;%lu;%lum        " set background color
set t_Co=256                         " Enable 256 colors


" Colorscheme
"====================================================================
colorscheme desert


" Persistent Undo
"====================================================================
set undofile
set undodir=~/.vim/undo


" Custom Leader Key
"====================================================================

" use spacebar as leader, and leader + w to save
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>


" Panels
"====================================================================

" new splits open either to the right or to the bottom of the currrent
set splitright
set splitbelow

" navigate panels with Ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Visual Interface
"====================================================================

" display autocomplete options in the command bar
set wildmenu

" display line numbers relative to current line
set number
set relativenumber

" highlight search terms
set hlsearch


" Programming Preferences
"====================================================================

" tab to be 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab


" Vim Education
"====================================================================

" display typed keys
set showcmd

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" Full Text Search
"====================================================================

" use ag intead of grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m   " file:line:column:message
  " shortcut command named Ag
  " http://ellengummesson.com/blog/2015/08/01/dropping-ctrlp-and-other-vim-plugins/
  command! -bang -nargs=* -complete=file -bar Ag silent! grep! <args>|redraw!
  autocmd QuickFixCmdPost *grep* cwindow
endif

" file patterns to ignore
set wildignore+=.git/*,node_modules/*
set wildignore+=*.swp




"--------------------------------------------------------------------
" Requires Plugins
"--------------------------------------------------------------------


" Filename completion
"====================================================================
" @TODO Ctrl+P

