"only vimsettings
set nocompatible
"use pathogen which is a bundle manager that I have installed in the .vim
"folder already
execute pathogen#infect()
"set highlight search on
set hlsearch
nnoremap <silent> <leader>e :nohl<CR><C-l>
"make vim not mangle pasted stuffs
"set paste
"If using a xterm-256color terminal (OS X 10.7+ and maybe ubuntu?)set the
"colorscheme. look in .vim/colors/for all the colorschemes installed.
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
set t_Co=256
colors solarized
"set column 81 to show 80 column border to keep code organized
set colorcolumn=81
"folding
set foldmethod=indent
set foldnestmax=5
set nofoldenable
set foldlevel=1
"set indents stuff
set autoindent
set smartindent
"set leaderkey
let mapleader='\'
"set guioptions
set guioptions-=L
set guioptions-=M
set guioptions-=r
set guioptions-=T
"random
set noshowmode
"set line numbers on and for print
set printoptions=number:y
"ViM gave me some crap for not having this so I put it in just for kicks and
"giggles
set modifiable
"highlight the current line... much better than you will expect
"set cursorline
"set noswapfile
set noswapfile
"set error crap
set noerrorbells
set visualbell
"if using GViMset the font to 12pt ProggyCleanTT. change it to whatever you
"want or delete this line.
set guifont=ProggyCleanTT:h13
"turn on column and line number count at the bottom of the screen
set ruler
"turn on being able to backspace through the beginning of one line onto the
"line above it.
set backspace=indent,eol,start
"expand tabs to spaces
set noexpandtab
"set nojoinspaces
set tabstop=4
set shiftwidth=4
"keep current indent on next line when pressing enter in insert mode
set shiftround
"ignore the case when searching
set ignorecase
"when pasting from system clipboard press F9 to enter pastemode which will
"make pasting much easier. only available in inseert mode
set pastetoggle=<C-p>
"don't backup the file. this still creates a swap file. just save frequently
"OR you can delete this line.
set nobackup
"turn line numbers on. on the left side of the screen as usual in an IDE
set number
"when splitting a window, split the to the bottom of the current window
set splitbelow
"when vertically splitting a window, split to the right of the current window
set splitright
"press ctrl-n to open NERDTree (file manager)
map <C-f> :NERDTreeToggle<CR>
"turn syntax hilighting on
syntax enable
"turn linewrapping on
set wrap
"tbh don't really know what this does. It was recommended by several websites
set linebreak
"press '\\' then w to use easymotion forward or b for backward
let g:EasyMotion_leader_key = '\\'
"THE MAP PREFIX 'C' MEANS CTRL ON THE KEYBOARD THE LETTERS FOLLOWING IT ARE
"THE ACTUAL KEYS TO PRESS. PREFIX 'S' = SHIFT ON THE KEYBOARD
"'so' to source ~/.vimrc
map so :so ~/.vimrc<CR>
"move to split to the right of current window
map <C-j> <C-W><C-j>
nnoremap <Leader><Leader>o o<Esc>ko<Esc>o
nnoremap <Leader><Leader>oo o<Esc>ko
"move current split to new tab
map <S-t> <C-W>T
"move to split above current
map <C-k> <C-W><C-k>
"move to split left of current
map <C-h> <C-W><C-h>
"move to split right of current
map <C-l> <C-W><C-l>
"Leader + '=' key resize all splits to be equal size
nnoremap <Leader>= <C-w>=
"'sw' switchs windows
nnoremap wi <C-W><C-W> 
"no idea what this does. as far as i can tell, it does nothing.
map <C-z> <C-W><C-R>
"line 76 and 77 map 'Q' (S-q) to reformat a paragraph. haven't used it much
"yet. may find a use later
vmap Q gq
nmap Q gqap
"make line movement more natural using lines 81 and 82. trust this map. it
"helps with wrapped lines.
nnoremap j gj
nnoremap k gk
"eliminate the need to ':' into command mode. just press ';' and it will
"automatically be converted. removes 2 keystrokes to enter command mode
nnoremap ; :
"move to tab to the left
nnoremap <S-h> gT
"move to tab to the right
nnoremap <S-l> gt
"open new tab
nnoremap <C-t> :tabnew<CR>
"open new tab. keep this line
inoremap <C-t> <Esc>:tabnew<CR>
"map <<e' in insert mode to <ESC>
inoremap ,,e <Esc>
"the rest of the lines are code completion
filetype indent plugin on
"set omnifunc=syntaxcomplete#Complete
"python from Powerline.vim importsetup as Powerline_setup
"python Powerline_setup()
"python del Powerline_setup
"set rtp+=usr/local/lib/python2.7/site-packages/Powerline/bindings/vim
set encoding=utf-8
set laststatus=2
"let g:Powerline_symbols = 'unicode'
"let g:syntastic_php_checkers = ['php']
"bind z to suspend
nnoremap z :suspend<CR>
"stuff for haskell
let g:haddock_browser="/Applications/Safari.app"
nnoremap <Leader>rl :reload in GHCi<CR>
autocmd Filetype haskell set expandtab
autocmd Filetype haskell set tabstop=8
autocmd Filetype haskell set shiftwidth=4
autocmd Filetype haskell set smarttab
autocmd Filetype hasekll set shiftround
autocmd Filetype haskell set nojoinspaces
autocmd Filetype haskell set ai
autocmd Filetype haskell set softtabstop=4
autocmd Filetype elm set softtabstop=2
autocmd Filetype elm set shiftwidth=2

"custom vim func to find and replace all occurences
function! SANDR()
	call inputsave()
	let b:s=input('search: ')
	let b:r=input('replace: ')
	call inputrestore()
	execute '%s/' . b:s . '/' . b:r . '/geI'
endfunction

noremap <Leader>sr :call SANDR()<CR>
"spell check toggle

nnoremap <Leader>sp :setlocal spell! spelllang=en_us<CR>
nnoremap <Leader>nsp :setlocal nospell!<CR>

"turn on filetype stuff
" filetype on
filetype plugin indent on

"tabularize plugin stuffs
function! Alignby()
	call inputsave()
	let b:a=input('align by: ')
	call inputrestore()
	execute "'<,'>Tab /" . b:a . <CR>
endfunction

nnoremap <Leader>t :call Alignby()<CR>

inoremap <Bar> <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
