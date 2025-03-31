Enable window control mode, automatically add `<c-w>` before keystrokes for quick control

## Install

### VimPlug
Add to your vimrc
```vim
Plug 'A4-Tacks/winmode.vim'
```
Run `:PlugInstall`

## Configure

Add to your vimrc
```vim
nnoremap <silent> <c-w>m            :call winmode#start()<cr>
nnoremap <silent> <c-w><c-m>        :call winmode#start()<cr>
tnoremap <silent> <c-w>m        <cmd>call winmode#start(v:true)<cr>
tnoremap <silent> <c-w><c-m>    <cmd>call winmode#start(v:true)<cr>
```
