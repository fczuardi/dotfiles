" Truecolor 
"====================================================================
set termguicolors                    " Enable GUI colors for the terminal to get truecolor
set t_8f=[38;2;%lu;%lu;%lum        " set foreground color
set t_8b=[48;2;%lu;%lu;%lum        " set background color
set t_Co=256                         " Enable 256 colors


" Colorscheme
"====================================================================
colorscheme evening


" Visual Interface
"====================================================================

" display line numbers relative to current line
set number
set relativenumber


" Vim Education
"====================================================================

" display typed keys
set showcmd

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" Custom Shortcuts
"====================================================================

" navigate panels with Ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" use spacebar as leader, and leader + w to save
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>

