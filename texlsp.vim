" L'LSP per LaTeX (texlab) lo registra vim-lsp-settings da solo

" ============================================
"  Configurazione VimTeX
" ============================================
" I file .tex sono sempre LaTeX (senza, un file nuovo o senza \documentclass diventa 'plaintex')
let g:tex_flavor = 'latex'

" Questa versione di VimTeX chiede Vim 9.2, qui c'è la 9.1: saltiamo il controllo (provato, funziona).
" Se aggiorni Vim alla 9.2 puoi togliere questa riga
let g:vimtex_version_check = 0

" Niente visualizzatore da Vim: il PDF lo apro con sioyek su Windows, che si aggiorna da solo
let g:vimtex_view_enabled = 0
let g:vimtex_compiler_latexmk_engines = {'_': '-lualatex'}
" \lc cancella anche i file che latexmk non conosce: .listing (tcolorbox) e .synctex.gz
let g:vimtex_compiler_latexmk = {'clean_ext': 'listing synctex.gz'}

" La lista della compilazione si apre da sola solo se ci sono errori; warning ed errori si aprono/chiudono
" con Ctrl-l (vedi LspDiagOpenEW in clsp.vim), quindi \le di VimTeX non serve
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_mappings_disable = {'n': ['<localleader>le']}

