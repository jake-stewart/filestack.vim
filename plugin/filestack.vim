function! NavigateFileJumplist(direction)
    let [l:jumplist, l:pos] = getjumplist()
    let l:key = a:direction == 1 ? "1\<c-i>" : "\<c-o>"
    let l:bufnr = bufnr()
    while 1
        let l:pos += a:direction
        if l:pos < 0 || l:pos >= len(l:jumplist)
            return
        endif
        exe "norm " . l:key
        if l:bufnr != l:jumplist[l:pos]["bufnr"]
            break
        endif
    endwhile
    let l:bufnr = l:jumplist[l:pos]["bufnr"]
    while 1
        let l:pos += 1
        if l:pos >= len(l:jumplist)
            break
        endif
        if l:bufnr != l:jumplist[l:pos]["bufnr"]
            break
        endif
        exe "norm 1\<c-i>"
    endwhile
endfunction
