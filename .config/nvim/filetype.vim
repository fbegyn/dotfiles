source /usr/share/nvim/runtime/filetype.vim

" ledger filetype"
au BufNewFile,BufRead $HOME/Documents/Finances/Ledger/*.journal setf ledger
