" C_ListFuncs: creates a menu of functions using flist
"   Author: Marcel van der Laan <Marcel.van.der.Laan@ict.nl>
func! C_ListFuncs()
  set lz
  let tmpfile=tempname()
  exe ":edit " . tmpfile
  " Get the list of global files
  exe ":0read !flist -S256 -g # |grep \"  \""
  " Get the list of local (static) files
  exe ":read !flist -S256 -s # |grep \"  \""
  " Remove last line
  normal! Gdd
  " Transform into script
  " Remove function parameters
  %s/\s*(.*$//ge
  " Remove leading spaces
  %s/^ \+//e
  " Escape remaining spaces
  %s/ /\\ /ge
  " Make a menu
  if &term == "win32"
    %s/^/:amenu ]Functions./e
  else
    %s/^/:amenu Functions./e
  endif
  %s/\(\w\+\)$/\1 :tag \1<CR>/e
  " Write and source, then remove buffer
  write
  exe "source! ".tmpfile
"  delete(tmpfile)
  bd!
  set nolz
  if &term == "win32"
    " Show the menu
    tearoff Functions
  endif
endfunc
