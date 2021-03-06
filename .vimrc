" Encoding
"====================================================================
set encoding=utf-8
set fileencoding=utf-8

" Shorter timeout for escape sequences
"====================================================================
" the default value can cause lag when you try P or O after an Esc
set timeoutlen=500

" Update timeout, useful for gitgutter
set updatetime=500

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
" a function I have made to color the line differently depending on the
" mode you are (normal/insert), I have commented it because performance
" suffers
" function! s:insertCursorLine()
"   " https://stackoverflow.com/a/14048055
"   let g:default_CursorLineBg = synIDattr(synIDtrans(hlID('CursorLine')), 'bg')
"   if &background ==# "light"
"     highlight CursorLine guibg=white
"   else
"     highlight CursorLine guibg=gray10
"   endif
" endfunction
" function! s:defaultCursorLine()
"   execute("highlight CursorLine guibg=" . g:default_CursorLineBg)
" endfunction
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

" Panels and Tabs
"====================================================================

" new splits open either to the right or to the bottom of the currrent
set splitright
set splitbelow

" navigate panels with Ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set tabpagemax=100
set switchbuf=useopen,usetab

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


" Visual Interface
"====================================================================

" display autocomplete options in the command bar
set wildmenu
" first tab match up to longest common part and open the wildmenu
" second tab cycles to next full suggestion
set wildmode=longest:full,full

" display line numbers relative to current line
" set number
" set relativenumber

" highlight search terms
set hlsearch

" always display filename on the bottom, even for a single screen
set laststatus=2

" Programming Preferences
"====================================================================

" tab to be 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab


" Display tab chars and trailing spaces
"====================================================================
" set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
set listchars=tab:␉·,trail:␠,nbsp:⎵
set list



" Vim Education
"====================================================================

" display typed keys
set showcmd

" disable arrow keys (on normal mode)
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>


" Thinkpad bad placed PgUp PgDown is annoying on insert mode
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


" Git diff lines on the gutter (sign column)
" ==================================================================
Plug 'airblade/vim-gitgutter'
set signcolumn=yes


" Fancy Statusline
" ==================================================================

Plug 'itchyny/lightline.vim'
set noshowmode
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
  \ }
  \ }

" Focus mode (Goyo + Limelight)
" ==================================================================
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
nnoremap <Leader>z :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!




" Colorschemes
"====================================================================

" Colorscheme quick switcher with F8 and shift + F8
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
" let g:colorscheme_switcher_keep_background=1

" Switch between dark and light with F9
" map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
map <F9> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" use F7 to cycle lightline themes (hackish by myself)
let g:lightline_current_theme_index=0
function! ChangeStatusbarColor()
  " let g:lightline.colorscheme = new_lightline_theme
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
  echo g:lightline.colorscheme
endfunction

function! CycleLineTheme()
  let g:lightline_current_theme_index = (g:lightline_current_theme_index + 1) % 19
  let lightline_theme_names=['wombat', 'solarized', 'powerline', 'jellybeans', 'Tomorrow',
        \ 'Tomorrow_Night', 'Tomorrow_Night_Blue', 'Tomorrow_Night_Eighties',
        \ 'PaperColor', 'seoul256', 'landscape', 'one', 'darcula', 'molokai', 'materia',
        \ 'material', 'OldHope', 'nord', 'deus']

  let new_lightline_theme = lightline_theme_names[g:lightline_current_theme_index]
  let g:lightline.colorscheme = new_lightline_theme
  call ChangeStatusbarColor()
endfunction
map <F7> :call CycleLineTheme()<CR>

" My Favorite Themes
" ==================================================================

  " === TOP 5 ===

  " Two Firewatch
  Plug 'rakr/vim-two-firewatch'

  " Zenburn
  " Zenburn is a low-contrast color scheme for Vim.
  " http://kippura.org/zenburnpage/
  Plug 'jnurmine/Zenburn'

  " nova
  " A coding color scheme where each color has a dedicated purpose.
  " https://trevordmiller.com/projects/nova
  Plug 'trevordmiller/nova-vim'

  " frign
  " A simple, blue, almost monocromatic, 24-bit color scheme for vim
  Plug 'KimNorgaard/vim-frign'

  " Alduin
  " https://github.com/AlessandroYorba/Alduin
  Plug 'AlessandroYorba/Alduin'
  let g:alduin_Shout_Dragon_Aspect     = 0 " darkest gray background
  let g:alduin_Shout_Become_Ethereal   = 1 " black background

  let g:alduin_Shout_Fire_Breath       = 1 " dark red highlight
  let g:alduin_Shout_Animal_Allegiance = 0 " remove background from strings
  let g:alduin_Shout_Aura_Whisper      = 0 " remove block matchparens - add underline

  " === TOP 10 ===

  " Snow
  " a blue-tinted winter vimscape (low-contrast vim theme/colorscheme)
  " https://github.com/nightsense/snow
  Plug 'nightsense/snow'

  " gruvbox
  Plug 'morhetz/gruvbox'
  let g:gruvbox_contrast_light = "hard"

  " Paramount
  " A minimal colorscheme for Vim that only puts emphasis on the paramount.
  " https://github.com/owickstrom/vim-colors-paramount
  Plug 'owickstrom/vim-colors-paramount'

  " vim-colors-plain
  " This is a fork of vim-colors-off which is being developed based on my personal taste.
  " https://github.com/andreypopp/vim-colors-plain
  Plug 'andreypopp/vim-colors-plain'

  " Tender
  Plug 'jacoborus/tender.vim'


  " === Others ===

  " palenight
  Plug 'drewtempelmeyer/palenight.vim'

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

if $DISPLAY == ""
  let is_x_terminal = 0
else
  let is_x_terminal = 1
endif

let g:colorscheme_switcher_exclude_builtins=1
if is_x_terminal
  let g:colorscheme_switcher_exclude = ['plain-cterm']
  " autocmd VimEnter * colorscheme snow
  " autocmd VimEnter * colorscheme alduin
  autocmd VimEnter * colorscheme two-firewatch
  let g:lightline.colorscheme = 'jellybeans'
  autocmd VimEnter * call ChangeStatusbarColor()
else
  let g:colorscheme_switcher_exclude = ['Base2Tone_EveningDark', 'Base2Tone_MorningDark', 
    \ 'Base2Tone_PoolDark', 'neodark', 'zenburn', 'frign', 'nova', 'alduin', 'nord', 'plain', 'snow']
  autocmd VimEnter * colorscheme tender
  let g:lightline.colorscheme = 'OldHope'
  autocmd VimEnter * call ChangeStatusbarColor()
endif



" Code formatters
"====================================================================

Plug 'w0rp/ale'
let g:airline#extensions#ale#enabled = 0

let g:ale_linters = {}
let g:ale_fixers = {}
let g:ale_fix_on_save = 0
let g:ale_lint_on_text_changed = 0
let g:ale_linters_explicit = 1
let g:ale_set_quickfix = 1


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
let g:ale_linters['javascript'] = ['eslint']
let g:ale_fixers['javascript'] = ['prettier']
" let g:ale_linters['javascript'] = ['prettier']


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

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
