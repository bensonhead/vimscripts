function s:FindTerminal()
  for inf in getwininfo()
    if inf.terminal 
      " echo "terminal buffer=" . inf.bufnr
      " let w:TERMBUF=inf.bufnr
      return inf.bufnr
    endif
  endfor
  echo "terminal not found"
  return -1
endfun

function s:AttachedTerm()
  let term = get(g:, 'TERMBUF', -1)
  if term >= 0
    return term
  endif
  let term = get(w:, 'TERMBUF', -1)
  if term >= 0
    return term
  endif
  let term = <SID>FindTerminal()
  return term
endfun

function s:CreateMappings()
  nnoremap <C-CR> :call term_sendkeys(<SID>AttachedTerm(), getline(line("."))."\r")<CR>
  " sometimes 2 <CR> is needed, sometimes 1; not sure when
  vnoremap <C-CR> :silent g/^/call term_sendkeys(<SID>AttachedTerm(), getline(line("."))."\r")<CR><CR>

endfunction

command! -nargs=? Term {
  var thiswin = win_getid()
  :term <args>
  win_gotoid(thiswin)
  call <SID>CreateMappings()
}

if has("gui")
  menu &Plugins.&Term :Term
endif
