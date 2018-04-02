" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Dan - my settings
" Set to show invisible (tabs & trailing spaces) & their highlight color
set list listchars=tab:»\ ,trail:·
" Use "Hybrid" line numbers
set number relativenumber
" Save backup files to a central folder (the folder must exist)
" https://stackoverflow.com/questions/607435/why-does-vim-save-files-with-a-extension
" http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
" https://stackoverflow.com/questions/15660669/what-is-a-un-file-or-or-why-does-vim-in-the-terminal-make-the-un-file
" https://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
set backupdir=~/.vim/backup//
set directory=~/.vim/backup//
set undodir=~/.vim/backup//
" Great color scheme, clone:
" https://github.com/lifepillar/vim-solarized8
set background=dark
colorscheme solarized8_high
" Use two spaces for indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Show screen line that the cursor is in, works great with solarized8
set cursorline

filetype plugin on

" vim-airline
let g:airline_powerline_fonts = 1

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
