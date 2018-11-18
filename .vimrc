" Encoding
"====================================================================
set encoding=utf-8
set fileencoding=utf-8

" Truecolor
"====================================================================
if has('termguicolors')
  set termguicolors                    " Enable GUI colors for the terminal to get truecolor
  set t_8f=[38;2;%lu;%lu;%lum        " set foreground color
  set t_8b=[48;2;%lu;%lu;%lum        " set background color
  " set t_Co=256                         " Enable 256 colors
  " vim hardcodes background color erase even if the terminfo file does
  " not contain bce (not to mention that libvte based terminals
  " incorrectly contain bce in their terminfo files). This causes
  " incorrect background rendering when using a color theme with a
  " background color.
  let &t_ut=''
else
  set t_Co=256
endif

" Scrolwheel / Trackpoint scroll
"====================================================================
set mouse=a

" Cursorline
"====================================================================
function! s:insertCursorLine()
  " https://stackoverflow.com/a/14048055
  let g:default_CursorLineBg = synIDattr(synIDtrans(hlID('CursorLine')), 'bg')
  if &background ==# "light"
    highlight CursorLine guibg=white
  else
    highlight CursorLine guibg=gray10
  endif
endfunction
function! s:defaultCursorLine()
  execute("highlight CursorLine guibg=" . g:default_CursorLineBg)
endfunction
" autocmd InsertEnter * call s:insertCursorLine()
" autocmd InsertLeave * call s:defaultCursorLine()

set cursorline

" ColorColumn
" ~=================================================================
set colorcolumn=100

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


" Scroll before hitting the firs or last line in the screen
" ~=================================================================
set scrolloff=8

" Search 
"====================================================================
" case insensitive  unless the search has capital letters
set ignorecase
set smartcase

" incremental search
set incsearch

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
" first tab match up to longest common part and open the wildmenu
" second tab cycles to next full suggestion
set wildmode=longest:full,full

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


" Thinkpad bad placed PgUp PgDown
" ===================================================================
inoremap <PageUp> <NOP>
inoremap <PageDown> <NOP>



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
Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-commentary'



" Different Comment String for an embedded different (example, jsx on js) 
"====================================================================
" Plug 'suy/vim-context-commentstring'

" autocmd! BufRead,BufNewFile *.{jsx,jx,js} setlocal filetype=javascript.jsx


" Tab to complete instead of Ctrl-P Ctrl-N
"====================================================================
Plug 'ervandew/supertab'



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

" Colorscheme quick switcher F8
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
let g:colorscheme_switcher_exclude_builtins=1

" Switch between dark and light with F9
" map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
map <F9> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

  " === TOP 5 ===

  " Snow
  " a blue-tinted winter vimscape (low-contrast vim theme/colorscheme)
  " https://github.com/nightsense/snow
  Plug 'nightsense/snow'

  " Zenburn
  " Zenburn is a low-contrast color scheme for Vim.
  " http://kippura.org/zenburnpage/
  Plug 'jnurmine/Zenburn'

  " nova
  " A coding color scheme where each color has a dedicated purpose.
  " https://trevordmiller.com/projects/nova
  Plug 'trevordmiller/nova-vim'

  " Paramount
  " A minimal colorscheme for Vim that only puts emphasis on the paramount.
  " https://github.com/owickstrom/vim-colors-paramount
  Plug 'owickstrom/vim-colors-paramount'

  " frign
  " A simple, blue, almost monocromatic, 24-bit color scheme for vim
  Plug 'KimNorgaard/vim-frign'


  " === TOP 10 ===

  " gruvbox
  Plug 'morhetz/gruvbox'
  let g:gruvbox_contrast_light = "hard"

  " vim-colors-plain
  " This is a fork of vim-colors-off which is being developed based on my personal taste.
  " https://github.com/andreypopp/vim-colors-plain
  Plug 'andreypopp/vim-colors-plain'

  " palenight
  Plug 'drewtempelmeyer/palenight.vim'

  " Tender
  Plug 'jacoborus/tender.vim'

  " Two Firewatch
  Plug 'rakr/vim-two-firewatch'


  " === Others ===

  " nord
  Plug 'arcticicestudio/nord-vim'

  " NeoDark
  " NeoDark is a very dark colorscheme based on the color pallet of vim-gotham. This colourscheme was developed with a minimal NeoVim config in mind. Currently only terminal vim is supported.
  Plug 'CallumHoward/vim-neodark'

  " Base2Tone
  " http://base2t.one/
  " https://github.com/atelierbram/Base2Tone-vim
  Plug 'atelierbram/Base2Tone-vim'

  " === disabled for now ===

  " " base 16
  " Plug 'chriskempson/base16-vim'

  " Base2Tone
    " CaveDark.vim
    " CaveLight.vim
    " DesertDark.vim
    " DesertLight.vim
    " DrawbridgeDark.vim
    " DrawbridgeLight.vim
    " EarthDark.vim
    " EarthLight.vim
    " EveningLight.vim
    " ForestDark.vim
    " ForestLight.vim
    " HeathDark.vim
    " HeathLight.vim
    " LakeDark.vim
    " LakeLight.vim
    " MeadowDark.vim
    " MeadowLight.vim
    " MorningLight.vim
    " PoolLight.vim
    " SeaDark.vim
    " SeaLight.vim
    " SpaceDark.vim
    " SpaceLight.vim

  " " One-Half
  " Plug 'sonph/onehalf', {'rtp': 'vim/'}

  " " Apprentice
  " Plug 'romainl/Apprentice'

  " " Vim one
  " Plug 'rakr/vim-one'

  " " Dracula
  " Plug 'dracula/vim', { 'as': 'dracula' }

  " " noctu
  " " A Vim color scheme for 16-color terminals
  " " https://github.com/noahfrederick/vim-noctu
  " Plug 'noahfrederick/vim-noctu'

 
set background=dark
if has('termguicolors')
  autocmd VimEnter * colorscheme snow
  let g:lightline = { 'colorscheme': 'jellybeans' }
else
  autocmd VimEnter * colorscheme tender
  let g:lightline = { 'colorscheme': 'OldHope' }
endif


" Code formatters
"====================================================================

Plug 'w0rp/ale'
let g:airline#extensions#ale#enabled = 0

let g:ale_linters = {}
let g:ale_fixers = {}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0


" Git blame
"====================================================================
" default binding is <Leader>s
Plug 'zivyangll/git-blame.vim'


" Languages
"====================================================================

" Python
Plug 'andviro/flake8-vim', { 'for': 'python'}


" Stoq settings http://termbin.com/jg23
let g:PyFlakeCheckers = 'pep8,frosted'
" Remover em breve: E713
" E731: do not assign a lambda expression, use a def [pep8]
" E265: block comment should start with "# " [pep8]
let g:PyFlakeDisabledMessages = 'E266,E309,E713,E731,E265'
" This is not really working
let g:PyFlakeMaxLineLength=120
let g:PyFlakeSignStart=6000
" Disable ale for python, since I already have pyflakes
let g:ale_linters['python'] = []



" Javascript and jsx (React)
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }
let g:ale_linters['javascript'] = []
" let g:ale_fixers['javascript'] = ['prettier']


" syntax highlight inside template literals
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }


" ReasonML
" Reason syntax
Plug 'reasonml-editor/vim-reason-plus'
let g:ale_linters['reason'] = []
let g:ale_fixers['reason'] = ['refmt']
" LSP client
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" let g:LanguageClient_serverCommands = {
"     \ 'reason': ['ocaml-language-server', '--stdio'],
"     \ 'ocaml': ['ocaml-language-server', '--stdio'],
"     \ }
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
" nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
" nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>



call plug#end()

