if !exists('g:winmode_extra_cmd')
    let g:winmode_extra_cmd = {
                \ 'M': "norm!\<c-w>_\<c-w>|",
                \ 'm': "norm!\<c-w>=",
                \ "'": 'exe"norm!m".getcharstr()',
                \ ':': 'cal feedkeys(" ".winmode#cmd(a:term))',
                \ 'gb': 'bn',
                \ 'gB': 'bp',
                \ }
endif

function! winmode#cmd(term=v:false)
    if a:term
        return (&termwinkey && mode() ==# 't' ? &termwinkey : "\<c-w>").":"
    endif
    return ":"
endfunction

function winmode#start(term=v:false)
    let num = ''
    let oprefix = ''
    while v:true
        let ch = getcharstr()
        if ch =~# "[\<c-w>\<esc>\<c-m> ia]"
            return
        elseif num != '' && ch =~# '\d'
            let num *= 10
            let num += ch->str2nr()
        elseif ch =~# '\d'
            let num = ch->str2nr()
        elseif oprefix->empty() && ch ==# 'g'
            let oprefix = 'g'
        else
            if g:winmode_extra_cmd->has_key(oprefix.ch)
                let cmd = num.g:winmode_extra_cmd[oprefix.ch]
            else
                let cmd = "norm \<c-w>".num.oprefix.ch
            endif
            execute cmd
            echo cmd
            redraw
            let num = ''
            let oprefix = ''
        endif
    endwhile
endfunction
