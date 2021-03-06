" Custom tab line
function! public#MyTabLabel(n)
    let label   =  ''
    let buflist = tabpagebuflist(a:n)

    for bufnr in buflist
        if getbufvar(bufnr, '&modified')             " unsaved modified buffer?
            let label .= '  +'
            break
        else
            let label .= ' '
            break
        endif
    endfor

    let wincount = tabpagewinnr(a:n, '$')          " number of windows in tab
    if wincount > '1'
        let label .= ' ' . wincount                  " report how many windows
    endif


    let winnr    = tabpagewinnr(a:n)               " focused window number
    let fullname = bufname(buflist[winnr - 1])     " absolute file name
    let filename = fnamemodify(fullname, ':t')     " basename

    if filename == ''                              " empty buffers have No Name
        let filename = '[No Name]'
    endif

    let label .= ' ' . filename . ' '              " add filename to label
    return label
endfunction

function! public#MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))                 " for each open tab..
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'                   " make active tab stand out 
        else
            let s .= '%#TabLine#'                      
        endif

        let s .= '%{public#MyTabLabel(' . (i + 1) . ')}'    " add tab label 
        let s .= '%#TabLine#'                        " reset highlight
    endfor

    let s .= '%#TabLineFill#%T'                    " :help statusline
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999XX'                " right align the final 'X'
    endif

    return s
endfunction

" custome GUI tab label
function! public#TabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)

    " if there are modified buffers in tab, plus '+'
    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let label = '+'
            break
        endif
    endfor

    " if there are more than one window in tab, plus quantity of windows
    let wincount = tabpagewinnr(v:lnum, '$')

    if wincount > 1
        let label .= wincount
    endif
    if label != ''
        let label .= ' '
    endif

    return label
endfunction

"Close quick-fix window if it's last on screen
function! public#AutoCloseLastQuickFixWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction

function! CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction
