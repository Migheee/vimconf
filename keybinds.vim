let mapleader = " "
 
" iv / av = dentro / intorno alle virgolette doppie (come i" / a"), con ogni operatore: div, civ, yiv, viv...
onoremap iv i"
onoremap av a"
xnoremap iv i"
xnoremap av a"
nnoremap <leader>cd :Ex<CR>
nnoremap <leader>m :terminal glow %<CR>

" Scorciatoie valide solo per certi tipi di file. Altrove non fanno nulla (<Nop>), così non partono
" per sbaglio i comandi di Vim con gli stessi tasti (za = apri/chiudi piega, = = indenta)
nnoremap <leader>za <Nop>
nnoremap <leader>= <Nop>
inoremap <C-b> <Nop>

" \begin{nome} … \end{nome} come snippet di UltiSnips: $1 compare due volte, quindi il nome
" scritto nel \begin viene copiato nell'\end mentre lo scrivi; $0 è dove si arriva con Ctrl-j
function! s:Ambiente() abort
  return UltiSnips#Anon("\\begin{$1}\n\t$0\n\\end{$1}")
endfunction

augroup ScorciatoieFiletype
  autocmd!
  " Spazio za: salva e compila con VimTeX
  autocmd FileType tex nnoremap <buffer> <silent> <leader>za :w<CR>:VimtexCompileSS<CR>
  " Ctrl-b (Insert): \begin{} \end{} con il cursore nelle graffe del \begin
  autocmd FileType tex inoremap <buffer> <silent> <C-b> <C-r>=<SID>Ambiente()<CR>
  " Spazio = : reindenta tutto il file e riporta il cursore dov'era.
  " Solo C/C++: in LaTeX appiattirebbe lo pseudocodice dei blocchi codice
  autocmd FileType c,cpp nnoremap <buffer> <leader>= gg=G``
augroup END

