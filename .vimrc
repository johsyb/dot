syntax on
set number
set nocompatible
set backspace=2
set tabstop=4
set shiftwidth=2
set nobackup
set expandtab
set foldenable
set foldmethod=syntax
set foldnestmax=2
set number
set incsearch
set ruler
set backspace=indent,eol,start
set showcmd
"set display+=lastline
"set guioptions=mt
set et ts=4 sw=4
set autoindent
set display+=lastline
set pastetoggle=<F6>
set softtabstop=4
set cindent
set autochdir
set hlsearch 
set wmh=0

"tagi
set tags=tags;

retab

syntax on

filetype plugin indent on

let g:html_use_css = "1"

runtime ftpplugin/man.vim

au FileType make setlocal noexpandtab

highlight Pmenu guibg=brown gui=bold
autocmd FileType {xml,xslt} setlocal iskeyword=@,-,\:,48-57,_,128-167,224-235

"function! GoDefinition()
"   let pos = getpos(".")
"   normal! gd
"   if getpos(".") == pos
"       exe "tag " . expand("<cword>")
"   endif
"endfunction
"nnoremap <C-]> :call GoDefinition()<CR> 


function! CHANGE_CURR_DIR()
    let _dir = expand("%:p:h")
    if _dir !~ '^/tmp'
        exec "cd %:p:h"
    endif
    unlet _dir
endfunction

autocmd BufEnter * call CHANGE_CURR_DIR()

let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1

"map <C-Space> :tabn <CR>
"map <C-S-Space> :tabp <CR>

let g:jpTemplateKey = '<C-r>'

set ch=2
set nocp

map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set makeprg=LANGUAGE=C\ make
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

" Open and close all the three plugins on the same time
nmap <F8>   :TrinityToggleAll<CR>

" " Open and close the srcexpl.vim separately
nmap <F9>   :TrinityToggleSourceExplorer<CR>

" " Open and close the taglist.vim separately
nmap <F10>  :TrinityToggleTagList<CR>

" " Open and close the NERD_tree.vim separately
nmap <F11>  :TrinityToggleNERDTree<CR>

let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 2
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1
"unfloding function only
noremap [[  [[zMzvz.
noremap ]]  ]]zMzvz.

set cino=>s,e0,n0,f0,{0,}0,:0,=s,g0,h1s,p2,t0,+2,(2,)40,*30
">s     add 1 shiftwidth on normal indent
"e0     add 0 to prevailing-indent if '{' not at start-of-line
"n0     add 0 to prevailing-indent for statements after if/while/etc, if statements not inside {}
"f0     first opening { of a function/block is placed in column 0
"{0     opening braces are placed 0 characters from prevailing indent
"}4     closing braces are placed 4 characters from the matching opening {'s indent
"^-1s   add -1 space to prevailing-indent if opening brace is in column 0
":0     case labels are placed 0 characters from switch()'s indent
"=s     statements after a case label are placed 1 shiftwidth from indent of label
"g0     c++ scope (public, private, etc) placed 0 chars from indent of block they're in
"h1s    c++ statements after public/private/etc 1shiftwidth in
"p2     k&r function-argument parameter declarations placed 2chars in from margin
"t0     types for function declaration indented flush with margin
"+2     continuation lines (split lines) are indented an additional 2 spaces
"(2     when in unclosed parentheses, indent two spaces
")40    unclosed parentheses will be searched for at most 20 lines away
"*30    unclosed comments will be searched for 30 lines away
noremap <silent> <F11> :cal VimCommanderToggle()<CR>

:au Filetype html,xml,xsl source ~/.vim/script/closetag.vim 

set t_Co=256
"colorscheme desert256
colorscheme wombat256

function! SmartHome()
    if col(".") == 1 || col(".") > match(getline("."), '\S') + 1
        normal g^
    else
        normal g0
    endif
endfunction
inoremap <silent><home> <C-O>:call SmartHome()<CR>
nnoremap <silent><home> :call SmartHome()<CR>
vnoremap <silent><home> :call SmartHome()<CR>

map th :tabprev<CR>
map tl :tabnext<CR>
map tn :tabnew<CR>
map td :tabclose<CR> 

map bh :bp<CR>
map bl :bn<CR>


"map j :tabnew<CR>


map 1 1gt
map 2 2gt
map 3 3gt
map 4 4gt
map 5 5gt
map 6 6gt
map 7 7gt
map 8 8gt
map 9 9gt
map 0 10gt

noremap <silent> h :exe "silent! tabmove " . (tabpagenr() - 2)<CR>
noremap <silent> l :exe "silent! tabmove " . tabpagenr()<CR> 

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

nmap j <C-W>j<C-W>_
nmap k <C-W>k<C-W>_
nmap h <C-W>h
nmap l <C-W>l

autocmd BufWritePost .vimrc source %

function! AlignVariableDeclarations()
    let pos1 = line("'<")
    let pos2 = line("'>")
    let linenr = pos1
    while linenr <= pos2
        exec ":normal  " . linenr . "GA123"
        let linenr = linenr + 1
    endwhile
endfunction

vmap <C-=> :call AlignVariableDeclarations()<CR>



" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

