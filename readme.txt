From http://stackoverflow.com/questions/1031396/how-to-share-one-vimrc-file-among-multiple-clients/1184897#1184897 :

I use Dropbox. I've created a folder vim in my dropbox, which contains my .vimrc (actually: vimrc.vim) and colors, plugin, etc. directories.

Dropbox pushes all these files to all my computers (home, work, laptop, Bootcamp), so every time I want to change my vimrc, I can do so and I don't have to worry about copying it to the correct
directory or checking out the file from SVN or anything. Everything happens automagically!

My actual .vimrc contains only what's necessary to load the stuff I have in my Dropbox. On OSX and Linux, it looks like this:

set runtimepath+=~/Dropbox/vim
source ~/Dropbox/vim/vimrc.vim
On Windows, like this:

set runtimepath+=$HOME/My\ Documents/My\ Dropbox/vim
source $HOME\My Documents\My Dropbox\vim\vimrc.vim
And that's it!

(Actually, I put the vimrc's above in my Dropbox as well, so I don't have to remember them whenever I set up a new computer or re-install an old one.)

The free version of Dropbox will give you a 30 day revision history, the paid one will give you full revision history. Note that if you're on Linux, it's easiest if you use GNOME, for which Dropbox
has a nice client.

Conditional Settings

If you have slight configuration changes you would like to use on different machines this is a handy solution:

create a small function in each of your .vimrc files to return the type of system you are on:

fun! MySys()
    return 'linux'
endfun 

then in your global vimrc.vim file:

if MySys() == "linux"
    set backupdir=./.backup,/tmp
    set directory=./.backup,/tmp 
elseif MySys() == "windows"
    set backupdir=$HOME/AppData/Local/backup,$HOME/AppData/Local/tmp
    set directory=$HOME/AppData/Local/backup,$HOME/AppData/Local/tmp
endif
