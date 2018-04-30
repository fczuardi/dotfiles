" Truecolor 
"====================================================================
if has('termguicolors')
  set termguicolors                    " Enable GUI colors for the terminal to get truecolor
  set t_8f=[38;2;%lu;%lu;%lum        " set foreground color
  set t_8b=[48;2;%lu;%lu;%lum        " set background color
  set t_Co=256                         " Enable 256 colors
  " vim hardcodes background color erase even if the terminfo file does
  " not contain bce (not to mention that libvte based terminals
  " incorrectly contain bce in their terminfo files). This causes
  " incorrect background rendering when using a color theme with a
  " background color.
  let &t_ut=''
endif

" Colorscheme
"====================================================================
colorscheme desert


" Persistent Undo
"====================================================================
set undofile
set undodir=~/.vim/undo

" Swp files on a single dir
"====================================================================
set directory^=$HOME/.vim/tmp//

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
set wildignore+=*.swp,.git/*
" node js
set wildignore+=node_modules/*,**/lib/*,coverage/*





"--------------------------------------------------------------------
" Requires Plugins
"--------------------------------------------------------------------

call plug#begin('~/.vim/plugged')




" Comment / Uncomment (visual selection + gc, gc<movement> or gcc (1 line) 
"====================================================================
Plug 'tpope/vim-commentary'



" Filename completion
"====================================================================

" file fuzzy search
Plug 'ctrlpvim/ctrlp.vim'

" use ag for fast filenime find and dont keep a cache
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching=0
let g:ctrlp_match_window = 'max:72' 


" Colorschemes
"====================================================================

if has('termguicolors')
  " nova
  Plug 'trevordmiller/nova-vim'
  " autocmd VimEnter * colorscheme nova

  " base 16
  Plug 'chriskempson/base16-vim'
  autocmd VimEnter * colorscheme base16-onedark
endif


" Languages
"====================================================================

" Javascript and jsx (React)
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }




call plug#end()

