" Only load this indent file when no other was loaded.
if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetNginxIndent()

setlocal indentkeys=0{,0},0#,!^F,o,O

let b:undo_indent = 'setl inde< indk<'

" Only define the function once.
if exists('*GetNginxIndent')
  finish
endif

" TODO: handle line continuation
function! GetNginxIndent()
  " Find a non-blank line above the current line.
  let prevlnum = prevnonblank(v:lnum - 1)

  " Hit the start of the file, use zero indent.
  if prevlnum == 0
    return 0
  endif

  let ind = indent(prevlnum)
  let prevline = getline(prevlnum)

  " Add a 'shiftwidth' after '{'
  if prevline =~ '{\s*\%(#.*\)\?$'
    " Add 'shiftwidth' if the previous line is not a comment line.
    if prevline !~ '^\s*#'
      let ind = ind + shiftwidth()
    endif
  endif

  " Subtract a 'shiftwidth' on '}'
  " This is the part that requires 'indentkeys'.
  if getline(v:lnum) =~ '^\s*}'
    let ind = ind - shiftwidth()
  endif

  return ind
endfunction
