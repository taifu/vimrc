set runtimepath+=$HOMEPATH\Dropbox\Gvim
fun! MySys()
    return 'windows'
endfun
let vimrcfile=$HOMEPATH . "\Dropbox\Gvim\vimrc.vim"
execute "source " . fnameescape(vimrcfile)
execute "autocmd! bufwritepost " . fnameescape(vimrcfile) . " source " fnameescape(vimrcfile)
