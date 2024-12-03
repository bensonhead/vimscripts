
" navigate through the output of ls -laR

function DownDir()
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

function UpDir()
  ?^.*:$
  let thisdir=getline(".")[:-2]
  let path=split(thisdir,"/")
  if len(path)>1
    exec ":/^\\V" . escape(join(path[0:-2],"/"),"/") . ":\\$"
    exec ":/\\V ".escape(escape(path[-1]," "),"\\")."\\$"
  endif


endfunction

nmap <C-Down> :call DownDir()<CR>
nmap <C-Up> :call UpDir()<CR>
