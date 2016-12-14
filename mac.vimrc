set runtimepath+=~/Dropbox/Gvim
fun! MySys()
    return 'mac'
endfun
let vimrcfile='~/Dropbox/Gvim/vimrc.vim'
execute "source " . fnameescape(vimrcfile)
execute "autocmd! bufwritepost " . fnameescape(vimrcfile) . " source " fnameescape(vimrcfile)
