filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number
set relativenumber
set smartindent
set showmatch
set backspace=indent,eol,start
syntax on


" Cursore: blocco in normal mode, barra in insert (DECSCUSR: 2 = blocco, 4 = sottolineato, 6 = barra)
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"
let &t_ti .= "\e[2 q"
" Ripristina la barra anche all'uscita, per la shell
let &t_te .= "\e[6 q"
