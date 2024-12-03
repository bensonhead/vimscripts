
" navigate through the output of ls -laR

function s:DownDir()
  let l=getline(".")
  if l[0] != 'd'
    echo "not dir:".l
    return
  endif
  let namepos=match(l,"\\(\\d\\{2\\}:\\d\\{2\\} \\)\\@<=")
  let dir=l[namepos:]
  if dir==".."
    call UpDir()
  elseif dir=="."
    return
  else
    ?^.*:$
    let parent=getline(".")[:-2]
    exec ":/^\\V" . escape(parent . "/" . dir,"/")
    +4
  endif
endfunction 

function s:UpDir()
  ?^.*:$
  let thisdir=getline(".")[:-2]
  let path=split(thisdir,"/")
  if len(path)>1
    exec ":/^\\V" . escape(join(path[0:-2],"/"),"/") . ":\\$"
    exec ":/\\V ".escape(escape(path[-1]," "),"\\")."\\$"
  endif
endfunction

function s:mappings(arg)
  if tolower(a:arg) == "on"
    echo "Defined <C-Up> and <C-Down>"
    nnoremap <buffer> <C-Down> :call <SID>DownDir()<CR>
    nnoremap <buffer> <C-Up> :call <SID>UpDir()<CR>
  elseif tolower(a:arg) == "off"
    echo "Undefined <C-Up> and <C-Down>"
    nunmap <buffer> <C-Down>
    nunmap <buffer> <C-Up>
  elseif a:arg == ""
    echo nothing
  endif
endfunction

:command! -nargs=? Lslar :call <SID>mappings("<ARGS>")

if has("gui")
  menu &Plugins.ls\ -laR :Lslar on
endif

