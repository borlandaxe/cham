syntax on
set number
set ruler
set autoindent
set cursorline
set tabstop=4
set incsearch
set hidden
set backspace=indent,eol,start

let mapleader="."
let g:ConqueGdb_Leader = '\'

map <F6> :r!date \+\%F\ \%T<CR>kJ$a<CR><Esc>
map <F5> dd<Esc>
map <F4> :w<CR>
map <F3> :q!<CR>

map <Leader>5 :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . <CR>:UpdateTypesFileOnly<CR>:call Tag_syntax_coloring()<CR>:e<CR><CR>
map <Leader>4 :!cscope -Rbq -f cs.out <CR><CR>
map <Leader>3 :cs reset <CR>
map <Leader>2 :!rm -f cs.* tags types_*.taghl<CR><CR>
map <Leader>1 :cscope add cs.out <CR>
map <Leader>c :clo<CR>
map <Leader>s :w<CR>
map <Leader>r :e<CR>
map <Leader>q :bd<CR>
map <Leader>t :TagbarToggle<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>u :UpdateTypesFileOnly<CR>:call Tag_syntax_coloring()<CR><CR><CR><CR><CR>
map <Leader>y :YcmGenerateConfig<CR>

nmap <Leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <Leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>:cw<CR>
nmap <Leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cf :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>ci :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>

execute pathogen#infect()

set nocp
set noshowmode
set laststatus=2 
let g:airline#extensions#tabline#enabled = 1

set background=light
let g:solarized_termcolors=256
color solarized
let g:ycm_confirm_extra_conf = 0

map <c-m>l :set background=light<CR>:color solarized<CR>
map <c-m>d :set background=dark<CR>:color solarized<CR>

filetype plugin on

set cscopequickfix=s-,c-,d-,i-,t-,e-

set completeopt=longest,menu

noremap <C-J> 	<C-W>j
noremap <C-K> 	<C-W>k
noremap <C-H> 	<C-W>h
noremap <C-L> 	<C-W>l

noremap <tab> 	:MBEbn<CR>
noremap <S-tab> :MBEbp<CR>

let &termencoding=&encoding
set fileencodings=utf-8,gbk

"filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'wikitopian/hardmode'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'fholgado/minibufexpl.vim'
call vundle#end()            " required
filetype plugin indent on 

"let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files'] 	"use git for listing.
let g:ctrlp_working_path_mode = 'wa' 							"scan CWD.
let g:ctrlp_max_files = 0										"unlimited file num.
let g:ctrlp_brief_prompt = 1 									"<bs> to exit on empty prompt.

let g:UltiSnipsExpandTrigger="<cr>"
let g:UltiSnipsJumpForwardTrigger="<Leader>f"
let g:UltiSnipsJumpBackwardTrigger="<Leader>b"

map <Leader>g :ConqueGdb<CR>
let g:ConqueGdb_GdbExe="i386-elf-gdb"
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_InsertOnEnter = 0

"set cst
"set csto=1
"set nocsverb
"syntax enable
"colorscheme slate
"set shiftwidth=4
"set nowrapscan
"set laststatus=2
"set autowriteall
"map <C-m>5 :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . <CR>:UpdateTypesFileOnly<CR>:call Tag_syntax_coloring()<CR>:bufdo e .refresh<CR>:bd<CR><CR>

let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-h>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>', '<c-i>'],
    \ 'ToggleType(1)':        ['<c-l>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-&>', '<c-down>'],
    \ 'PrtCurLeft()':         ['<c-b>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-f>', '<right>'],
    \ }

  function! Tag_syntax_coloring()
	!echo "hi CTagsDefinedName ctermfg=5" >> types_c.taghl
	!echo "hi CTagsGlobalVariable ctermfg=0" >> types_c.taghl
	!echo "hi CTagsConstant ctermfg=8" >> types_c.taghl
	!echo "hi CTagsMember ctermfg=93" >> types_c.taghl
endfunction

function! DeleteAllBuffersInWindow()
		let s:curWinNr = winnr()
		if winbufnr(s:curWinNr) == 1
				ret
		endif
		let s:curBufNr = bufnr("%")
		exe "bn"
		let s:nextBufNr = bufnr("%")
		while s:nextBufNr != s:curBufNr
				exe "bn"
				exe "bdel ".s:nextBufNr
				let s:nextBufNr = bufnr("%")
		endwhile
endfunction

noremap <leader>dab :call DeleteAllBuffersInWindow()<CR>
