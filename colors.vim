" -------------------------------
" Tema GitHub Dark e LSP colori
" -------------------------------

set laststatus=2

" Lightline
let g:lightline = { 'colorscheme': 'ghdark' }

" Abilita TrueColor se disponibile
if has('termguicolors')
    set termguicolors
endif

" ----------------------------------
" Segni nella gutter (variabili vim-lsp)
" ----------------------------------
" Definiamo il testo prima che il plugin si avvii
let g:lsp_diagnostics_signs_error       = {'text': 'E>'}
let g:lsp_diagnostics_signs_warning     = {'text': 'W>'}
let g:lsp_diagnostics_signs_information = {'text': 'I>'}
let g:lsp_diagnostics_signs_hint        = {'text': 'H>'}

" ----------------------------------
" Autocmd per blindare i colori
" ----------------------------------
" Questo gruppo assicura che i nostri colori vengano applicati DOPO i plugin
augroup CustomLspHighlights
    autocmd!
    autocmd ColorScheme,VimEnter * call s:ApplyCustomHighlights()
augroup END

function! s:ApplyCustomHighlights() abort
    " Errori e warning principali
    highlight DiagnosticError guifg=#FA7970 guibg=NONE gui=bold
    highlight DiagnosticWarn  guifg=#FAA356 guibg=NONE gui=bold
    highlight DiagnosticInfo  guifg=#58a6ff guibg=NONE gui=NONE
    highlight DiagnosticHint  guifg=#3fb950 guibg=NONE gui=NONE

    " Testo inline (sottolineature o virtual text)
    highlight DiagnosticVirtualTextError guifg=#FA7970 guibg=NONE gui=italic
    highlight DiagnosticVirtualTextWarn  guifg=#FAA356 guibg=NONE gui=italic
    highlight DiagnosticVirtualTextInfo  guifg=#58a6ff guibg=NONE gui=italic
    highlight DiagnosticVirtualTextHint  guifg=#3fb950 guibg=NONE gui=italic

    " Forziamo vim-lsp a usare i nostri colori
    highlight link LspErrorText       DiagnosticError
    highlight link LspWarningText     DiagnosticWarn
    highlight link LspInformationText DiagnosticInfo
    highlight link LspHintText        DiagnosticHint

    " FIX: Rimuove l'evidenziazione bianca (QuickFixLine e CursorLine) dalla Location List
    highlight QuickFixLine guifg=NONE guibg=#0D1117 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
    highlight CursorLine   guibg=#161b22 gui=NONE

    " Altri highlight GitHub Dark
    highlight VertSplit    guifg=#30363d guibg=NONE
    highlight Pmenu        guifg=#c9d1d9 guibg=#161b22
    highlight PmenuSel     guifg=#0d1117 guibg=#58a6ff

    " --- PERSONALIZZAZIONE CURSORE E PARENTESI ---
    highlight Cursor guifg=#0d1117 guibg=#58a6ff ctermfg=black ctermbg=blue
    highlight MatchParen guifg=#ffffff guibg=#1f6feb gui=bold ctermfg=white ctermbg=blue cterm=bold
endfunction

" Applica il tema (questo triggererà l'autocmd qui sopra in automatico)
colorscheme ghdark

" Disabilita il messaggio di modalità
set noshowmode
