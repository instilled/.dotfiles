"
" Custom vim functions
"

" Strips trailing whitespaces while keeping cursor state
function! utils#StripTrailingWhitespace ()
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

function! utils#StripTrailingWhitespaceSilent ()
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  silent! %s/\s\+$//
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
