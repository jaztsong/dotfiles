" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

set t_Co=256
set encoding=utf-8
" Leader - ( Spacebar  )
let mapleader = " "
let maplocalleader = "  "

set splitbelow
set splitright
" ================ Scrolling ========================
"
set scrolloff=8         "Start scrolling when we're 8 lines away from " margins
set sidescrolloff=15
set sidescroll=1
" Auto resize Vim splits to active split
 set winwidth=84
 set winheight=5
 set winminheight=5
 set winheight=999
""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y



" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on
call pathogen#infect()
call pathogen#helptags()
" set runtimepath-=~/.vim/bundle/auto-paris
runtime bundle/vim-pathogen/autoload/pathogen.vim
set foldlevelstart=10
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2


" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a
set ttymouse=xterm2
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=1

" Set relative number
set number
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200



"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set tabstop=4 
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"AirVim setting
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'


set cursorline          " highlight current line
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
"----------------------------------------------------------------------------
" Pymode
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0
let g:pymode_rope_autoimport = 0
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
"----------------------------------------------------------------------------
"Easy Motion
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" "
" Tagbar
nmap <F8> :TagbarToggle<CR>

"----------------------------------------------------------------------------
" Bash-support
let g:BASH_LocalTemplateFile   =    $HOME.'/dotfiles/skeletons/BashSupport-Templates'
" SetMacro( 'AUTHOR',      'Lixing Song' )
" SetMacro( 'AUTHORREF',   '' )
" SetMacro( 'COMPANY',     'University of Notre Dame' )
" SetMacro( 'COPYRIGHT',   'Copyright (c) |2016|, |Lixing|' )
" SetMacro( 'EMAIL',       'lsong2@nd.edu' )
" SetMacro( 'LICENSE',     'GNU General Public License' )
" let g:BASH_AuthorName   = 'Lixing Song'                                                                                                                                                                  
" let g:BASH_Email        = 'lsong2@nd.edu'
" let g:BASH_Company      = 'University of Notre Dame'
"
"----------------------------------------------------------------------------
" Vim MarkDown
let g:vim_markdown_math = 1
" Turn on spell check when opening markdown file
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md call AutoCorrect()
"----------------------------------------------------------------------------
" Vim-commentary
autocmd BufRead,BufNewFile *.gp setlocal commentstring=#\ %s
"----------------------------------------------------------------------------
"
" " Vimtex
" imap <C-l> <Esc>[s1z=`]a
" autocmd BufRead,BufNewFile *.tex setlocal spell
" let g:vimtex_view_general_viewer = 'okular'

"
"----------------------------------------------------------------------------
" vim-skelenton
let skeletons#autoRegister = 1
let skeletons#skeletonsDir = '~/dotfiles/skeletons'
"------------------------------------------------------------
"
"----------------------------------------------------------------------------
"UltiSnips and YCM
let g:UltiSnipsUsePythonVersion = 2
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:ycm_autoclose_preview_window_after_completion = 1


"----------------------------------------------------------------------------
" Auto-paris
let g:AutoPairsFlyMode = 0
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"----------------------------------------------------------------------------
" Vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1, 
      \ 'i>'  :1, 
      \ 'ib'  :1, 
      \ 'iB'  :1, 
      \ 'il'  :0, 
      \ 'ip'  :0,
      \ 'ie'  :0, 
      \ }


"my personal settings
"
"Copy and Paste in the reg 1
vmap <Leader>c "1y
vmap <Leader>v "1p


" Solarized theme
" let g:solarized_termcolors=256
syntax enable
" set background=dark
" set term=screen-256color
colorscheme cobalt2

"-------------------------------------------------------------------
"

cnoremap W w
cnoremap Q q
cnoremap Wq wq
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
"remap autocomplete

nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>
" highlight last inserted text
nnoremap gV `[v`]
map <C-n> :NERDTreeToggle<CR>
au BufNewFile,BufRead *.gp,.gnuplot set syntax=gnuplot
au BufNewFile,BufRead *.gp,.gnuplot nmap <F5> :!gnuplot %<CR>
au BufNewFile,BufRead *.py nmap <F5> :!python %<CR>
au BufNewFile,BufRead *.sh nmap <F5> :!bash %<CR>

