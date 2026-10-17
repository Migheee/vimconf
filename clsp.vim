" ============================================
"  Completamento + LSP (asyncomplete + vim-lsp)
" ============================================

" --------- Completamento (asyncomplete) ----------
let g:asyncomplete_min_chars = 2
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noselect,noinsert
set pumheight=5

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-y>   pumvisible() ? "\<C-y>" : "\<C-g>u\<C-y>"
inoremap <silent> <C-Space> <Plug>(asyncomplete_force_refresh)
" Molti terminali (anche quello di Windows) inviano Ctrl-Space come Ctrl-@
inoremap <silent> <C-@> <Plug>(asyncomplete_force_refresh)

" --------- LSP (vim-lsp) ----------
" I server (clangd per C, texlab per LaTeX, marksman per Markdown) li registra vim-lsp-settings da solo

set signcolumn=yes

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0

nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> K  :LspHover<CR>
nnoremap <silent> <leader>rn :LspRename<CR>

" ------------------------------------------------
"  Location List (sezione “Errori & Warning”)
" ------------------------------------------------
nnoremap <silent> <C-l> :call LspDiagOpenEW()<CR>

function! LspDiagOpenEW() abort
    " 1. TOGGLE: Controlliamo se la Location List è già aperta
    " Se è aperta, la chiudiamo in silenzio e interrompiamo la funzione
    let l:loclist_winid = getloclist(0, {'winid': 0}).winid
    if l:loclist_winid != 0
        lclose
        return
    endif

    " Chiude anche la Quickfix List (dove VimTeX mette errori e warning di compilazione)
    if getqflist({'winid': 0}).winid != 0
        cclose
        return
    endif

    " 2. Nei file LaTeX: errori e warning dell'ultima compilazione (VimTeX)
    if exists('b:vimtex')
        call vimtex#qf#open(1)
        return
    endif

    " 3. Analizziamo i segni del buffer corrente (il tuo file .c)
    let l:placed = sign_getplaced(bufnr('%'), {'group': '*'})
    let l:has_ew = 0
    
    if !empty(l:placed) && !empty(l:placed[0].signs)
        for l:sign in l:placed[0].signs
            if l:sign.name =~? 'LspError' || l:sign.name =~? 'LspWarning'
                let l:has_ew = 1
                break
            endif
        endfor
    endif

    " 4. Se il file è pulito, stampa il successo
    if l:has_ew == 0
        echo "Nessun errore o warning LSP."
        return
    endif

    " 5. Se ci sono magagne, apri la lista ed evidenziale
    LspDocumentDiagnostics
    call s:QfColorEW()
endfunction


" ---------------------------------------------
"  QF panel: colore "Error" / "Warning"
" ---------------------------------------------
function! s:QfColorEW() abort
    " Usa i nomi corretti degli highlight definiti in colors.vim
    highlight default link QfEWError   DiagnosticError
    highlight default link QfEWWarning DiagnosticWarn

    syntax case ignore
    syntax match QfEWError   /\<error\>\(:\)\?/    containedin=ALL
    syntax match QfEWWarning /\<warning\>\(:\)\?/  containedin=ALL
    syntax case match
endfunction
