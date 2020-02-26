filetype indent plugin on

" Enable syntax highlighting
syntax on
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#interpose('bundle/vim-surround')
execute pathogen#interpose('bundle/auto-pairs')
execute pathogen#interpose('bundle/vim-commentary')
execute pathogen#interpose('bundle/vim-expand-region')
execute pathogen#interpose('bundle/vim-buftabline')
execute pathogen#interpose('bundle/lightline.vim')
" execute pathogen#interpose('bundle/vimCompletesMe')

let g:if_vim_lsp = 1
" ###################################################################
" This section is dedicated to configure LSP(language support protocol), which may impede vim performance. Feel free to comment out if needed.
if g:if_vim_lsp
	execute pathogen#interpose('bundle/async.vim')
	execute pathogen#interpose('bundle/vim-lsp')

	let g:if_asyncomplete = 0
	" let g:lsp_log_verbose = 1
	" let g:lsp_log_file = expand('~/vim-lsp.log')


	" for asyncomplete.vim log


	if executable('pyls')
		" pip install python-language-server
		au User lsp_setup call lsp#register_server({
					\ 'name': 'pyls',
					\ 'cmd': {server_info->['pyls']},
					\ 'whitelist': ['python'],
					\ })
	endif

	function! s:on_lsp_buffer_enabled() abort
		let g:if_asyncomplete = 1
		" setlocal omnifunc=lsp#complete
		setlocal signcolumn=yes
		nmap <buffer> ga <plug>(lsp-code-action)
		nmap <buffer> gd <plug>(lsp-definition)
		nmap <buffer> gR <plug>(lsp-rename)
		nmap <buffer> gr <plug>(lsp-references)
		nmap <buffer> K <plug>(lsp-hover)
		nmap <buffer> g[ <plug>(lsp-previous-error)
		nmap <buffer> g] <plug>(lsp-next-error)
		nmap <buffer> gb <plug>(lsp-previous-reference)
		nmap <buffer> gn <plug>(lsp-next-reference)
		nmap <buffer> <leader>f <plug>(lsp-document-format)
		vmap <buffer> <leader>f <plug>(lsp-document-format)
		
		" refer to doc to add more commands
	endfunction

	augroup lsp_install
		au!
		" call s:on_lsp_buffer_enabled only for languages that has the server registered.
		autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
	augroup END


	let g:lsp_signs_enabled = 1         " enable signs
	let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
	let g:lsp_highlight_references_enabled = 1
	highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green
	highlight LspErrorHighlight term=underline cterm=underline gui=underline
	highlight LspWarningHighlight term=underline cterm=underline gui=underline

	let g:lsp_signs_error = {'text': '✗'}
	let g:lsp_signs_warning = {'text': '‼'}
	let g:lsp_is_open = 1

endif

if g:if_asyncomplete
	execute pathogen#interpose('bundle/asyncomplete.vim')
	execute pathogen#interpose('bundle/asyncomplete-lsp.vim')
	" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
	" configure auto complete
	set shortmess+=c
	let g:asyncomplete_auto_popup = 0

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
	endfunction

	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ asyncomplete#force_refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
else
	execute pathogen#interpose('bundle/supertab')
endif
" ###################################################################
" ###################################################################




" Leader - ( Spacebar  )
let mapleader = " "
let maplocalleader = "  "


set splitbelow
set splitright
" ================ Scrolling ========================
" "
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
"
" TextEdit might fail if hidden is not set.
set hidden


" Give more space for displaying messages.
set cmdheight=2


""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"toggle line numbers
noremap <F3> :set invnumber\|:set relativenumber!<CR>
inoremap <F3> <C-O>:set invnumber\|:set relativenumber!<CR>
"Copy paste to/from clipboard
vnoremap <C-c> "*y
" set clipboard=unnamedplus
set clipboard=unnamedplus
" This helps vim startup quickly when doing X11 forwarding
set clipboard=exclude:.*

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set cursorline          " highlight current line

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
" set autoindent

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

" " Set relative number
set number
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

highlight LineNr ctermfg=darkgrey ctermbg=black
highlight Visual ctermfg=lightblue ctermbg=black
highlight Search ctermfg=blue ctermbg=white
highlight Comment ctermfg=darkgreen
"
"################################################################################
"----------------------------------------------------------------------------
" Auto-paris
let g:AutoPairsFlyMode = 0
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

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

"-------------------------------------------------------------------------
"vim vim-buftabline
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)
nnoremap <leader>d :bd<CR>
"------------------------------------------------------------
"
"
" Mappings 
"
"
" Useful mappings

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

cnoremap W w
cnoremap Q q
cnoremap Wq wq
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

" nmap <A-k> :wincmd k<CR>
" nmap <A-j> :wincmd j<CR>
" nmap <A-h> :wincmd h<CR>
" nmap <A-l> :wincmd l<CR>
"
" highlight last inserted text
nnoremap gV `[v`]

:nnoremap <leader>b Oimport pdb;pdb.set_trace()<esc>


au BufNewFile,BufRead *.gp,.gnuplot set syntax=gnuplot
au BufNewFile,BufRead *.gp,.gnuplot nmap <F5> :!gnuplot %<CR>
au BufNewFile,BufRead *.py nmap <F5> :!python %<CR>
au BufNewFile,BufRead *.sh nmap <F5> :!bash %<CR>
au BufNewFile *.py 0r ~/dotfiles/skeletons/skeleton.py | let IndentStyle = "python"
au BufNewFile *.gnuplot 0r ~/dotfiles/skeletons/skeleton.gp | let IndentStyle = "gnuplot"
au BufNewFile *.md 0r ~/dotfiles/skeletons/skeleton.md | let IndentStyle = "markdown"
au BufNewFile *.c 0r ~/dotfiles/skeletons/skeleton.c | let IndentStyle = "c"

