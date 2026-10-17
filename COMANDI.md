# I miei comandi Vim

Guida a tutti i comandi della mia configurazione (`~/.vimrc` → `~/.vim/vimrc`).

- **Leader** = `Spazio` (in questa guida `<Space>`)
- **Localleader** = `\` (non impostato, quindi resta il default; lo usa VimTeX)
- Per vedere questa guida formattata: apri il file e premi `<Space>m`

| File            | Contiene                                              |
|-----------------|-------------------------------------------------------|
| `options.vim`   | Indentazione, numeri di riga, forma del cursore       |
| `keybinds.vim`  | Scorciatoie generali (testo, file, markdown, LaTeX)   |
| `plugins.vim`   | Gestore plugin fatto a mano (clona da GitHub se manca) |
| `colors.vim`    | Tema GitHub Dark, barra di stato, colori diagnostica  |
| `fzf.vim`       | Scorciatoie di ricerca (fzf)                          |
| `clsp.vim`      | Completamento automatico, scorciatoie LSP, `Ctrl-l`   |
| `texlsp.vim`    | Impostazioni VimTeX (LaTeX)                           |

---

## 1. Scorciatoie personalizzate

### Modifica del testo (`keybinds.vim`)

| Tasto | Modo   | Equivale a | Cosa fa |
|-------|--------|------------|---------|
| `iv`  | dopo un operatore o in Visual | `i"` | Testo **dentro** le virgolette doppie: `div` cancella, `civ` cambia, `yiv` copia, `viv` seleziona. `"ciao"` → con `div` diventa `""` |
| `av`  | dopo un operatore o in Visual | `a"` | Testo **e** virgolette doppie: `dav`, `cav`, `yav`, `vav`. `"ciao"` → con `dav` sparisce |
| `<Space>=` | Normal | ``` gg=G`` ``` | Reindenta **tutto il file** e riporta il cursore dov'era. **Solo nei file C/C++**: in LaTeX appiattirebbe lo pseudocodice dei blocchi `codice` (per un pezzo di LaTeX: selezionalo e premi `=`) |

Promemoria: **v** = virgolette (`"`); **i** = inside (dentro), **a** = around (incluse).
Il cursore può stare ovunque sulla riga: Vim cerca da solo la coppia di virgolette.
Per gli apici singoli usa i comandi nativi `di'`, `ci'`, `yi'`… (`dis`/`das` sono i nativi "cancella frase").

### File e ricerca (`keybinds.vim`, `fzf.vim`)

| Tasto        | Comando     | Cosa fa |
|--------------|-------------|---------|
| `<Space>cd`  | `:Ex`       | Apre il file explorer (netrw) nella cartella del file corrente |
| `<Space>ff`  | `:Files`    | **F**ind **f**iles: cerca un file per nome nella cartella di lavoro |
| `<Space>fo`  | `:History`  | **F**ile **o**ld: file aperti di recente |
| `<Space>fb`  | `:Buffers`  | **F**ind **b**uffers: passa tra i file già aperti |
| `<Space>fg`  | `:Rg `      | **F**ind **g**rep: cerca testo *dentro* i file. Scrivi cosa cercare e premi Invio (Invio a vuoto = tutte le righe) |

### Markdown e LaTeX (`keybinds.vim`)

| Tasto        | Cosa fa |
|--------------|---------|
| `<Space>m`   | Mostra il file corrente formattato con `glow`, in uno split di terminale in basso. Chiudi con `:q` |
| `<Space>za`  | Salva e compila il file `.tex` corrente con VimTeX (latexmk + lualatex), con tutti i passaggi che servono per indice e riferimenti. Il PDF lo guardi con sioyek su Windows, che si aggiorna da solo |

> Se ci sono **errori**, in basso si apre da sola la lista (`Invio` su una riga salta al punto).
> I warning non la aprono: li vedi con `Ctrl-l`, che apre e chiude la lista. Se stai modificando un capitolo incluso in un altro file, VimTeX
> compila il file principale.

### LSP: navigazione nel codice (`clsp.vim`)

Funzionano nei file **C/C++** (clangd), **LaTeX** (texlab) e **Markdown** (marksman).

| Tasto    | Comando              | Cosa fa |
|----------|----------------------|---------|
| `gd`     | `:LspDefinition`     | **G**o to **d**efinition: salta a dove è definita funzione/variabile |
| `gr`     | `:LspReferences`     | **G**o to **r**eferences: elenca tutti i punti in cui è usata |
| `K`      | `:LspHover`          | Mostra documentazione/tipo di ciò che sta sotto il cursore |
| `<Space>rn` | `:LspRename`      | **R**e**n**ame: rinomina variabile/funzione sotto il cursore in tutto il progetto. Scrivi il nuovo nome (`Ctrl-u` cancella quello vecchio) e `Invio`. A differenza di `:%s/old/new/gc` cambia solo quel simbolo: non stringhe, commenti o parole uguali |
| `Ctrl-l` | `LspDiagOpenEW()`    | Apre/chiude la lista di **errori e warning**: nei file `.tex` quelli dell'ultima compilazione, negli altri quelli LSP. Se non ce ne sono, lo scrive in basso |

Per tornare indietro dopo un salto (`gd`, `gr`…): `Ctrl-o`. Per andare di nuovo avanti: `Ctrl-i`.

Nella lista errori aperta con `Ctrl-l`:
- `Invio` sulla riga → salta all'errore
- `:lnext` / `:lprev` → errore successivo / precedente
- `Ctrl-l` di nuovo → chiude la lista

### Completamento automatico (`clsp.vim`, modo Insert)

Il menu si apre da solo dopo **2 caratteri** e mostra al massimo **5 voci**; nessuna voce è preselezionata.

| Tasto        | Cosa fa |
|--------------|---------|
| `Tab`        | Voce successiva del menu |
| `Shift-Tab`  | Voce precedente del menu |
| `Ctrl-n` / `Ctrl-p` | Voce successiva / precedente (nativi di Vim, funzionano sempre) |
| `Ctrl-y`     | Conferma la voce scelta |
| `Ctrl-e`     | Chiude il menu annullando (nativo) |
| `Ctrl-Space` | Apre subito il menu dei suggerimenti, anche dopo una sola lettera o dopo averlo chiuso |

---

## 2. Comandi dei plugin (non personalizzati, ma disponibili)

### netrw — dentro il file explorer (`<Space>cd`)

| Tasto   | Cosa fa |
|---------|---------|
| `Invio` | Apre file/cartella |
| `-`     | Sale alla cartella superiore |
| `%`     | Crea un nuovo file |
| `d`     | Crea una nuova cartella |
| `D`     | Elimina |
| `R`     | Rinomina / sposta |
| `gh`    | Mostra/nasconde i file nascosti |
| `i`     | Cambia stile di visualizzazione (lista, albero…) |

### fzf — dentro le finestre di ricerca (`<Space>f…`)

| Tasto                 | Cosa fa |
|-----------------------|---------|
| scrivere              | Filtra i risultati (ricerca "fuzzy": `kbvim` trova `keybinds.vim`) |
| `Ctrl-j` / `Ctrl-k`   | Giù / su (anche `Ctrl-n` / `Ctrl-p`) |
| `Invio`               | Apre nella finestra corrente |
| `Ctrl-v`              | Apre in split **v**erticale |
| `Ctrl-x`              | Apre in split orizzontale |
| `Ctrl-t`              | Apre in una nuova **t**ab |
| `Tab` / `Shift-Tab`   | Seleziona più risultati (in `:Files`, `:Rg`) |
| `Esc`                 | Chiude |

Altri comandi fzf.vim utili, senza scorciatoia:

| Comando     | Cosa fa |
|-------------|---------|
| `:BLines`   | Cerca tra le righe del file corrente |
| `:Lines`    | Cerca tra le righe di tutti i buffer aperti |
| `:GFiles`   | Come `:Files`, ma solo file tracciati da git |
| `:Maps`     | **Cerca tra tutte le tue scorciatoie** (comodo per ricordarle) |
| `:Commands` | Cerca tra tutti i comandi disponibili |
| `:Helptags` | Cerca nell'help di Vim |

### vim-lsp — comandi utili senza scorciatoia

| Comando                                     | Cosa fa |
|---------------------------------------------|---------|
| `:LspNextError` / `:LspPreviousError`       | Salta all'errore successivo / precedente |
| `:LspNextDiagnostic` / `:LspPreviousDiagnostic` | Come sopra, ma include warning e suggerimenti |
| `:LspDocumentDiagnostics`                   | Lista di tutte le diagnostiche (anche info/hint) |
| `:LspCodeAction`                            | Correzioni rapide proposte dal server |
| `:LspDocumentFormat`                        | Formatta il file con il server LSP |
| `:LspTypeDefinition`                        | Salta alla definizione del **tipo** |
| `:LspPeekDefinition`                        | Mostra la definizione in un popup senza spostarti |
| `:LspDocumentSymbol`                        | Elenco di funzioni/variabili del file |
| `:LspStatus`                                | Mostra quali server LSP sono attivi |
| `:LspInstallServer`                         | Installa il server LSP per il tipo di file corrente (vim-lsp-settings) |
| `:LspManageServers`                         | Gestisce i server installati |

Nella colonna a sinistra compaiono i segni: `E>` errore, `W>` warning, `I>` informazione, `H>` suggerimento.

### VimTeX — solo nei file `.tex` (localleader = `\`)

**Compilazione e PDF**

| Tasto | Cosa fa |
|-------|---------|
| `\ll` | Avvia/ferma la compilazione continua (latexmk + lualatex): ricompila a ogni salvataggio |
| `\lk` | Ferma la compilazione |
| `\lc` | Cancella i file ausiliari (`.aux`, `.log`, `.toc`, `.listing`, `.synctex.gz`…), lascia solo `.tex` e PDF. In basso compare *"Compiler clean finished"* |
| `\lt` | Indice del documento (capitoli, sezioni) |
| `\li` | Informazioni sul progetto |

**Oggetti di testo** (si combinano con `d`, `c`, `y`, `v`: es. `cie`, `da$`, `vic`)

| Oggetto       | Seleziona |
|---------------|-----------|
| `ie` / `ae`   | Contenuto / intero **e**nvironment (`\begin{…}…\end{…}`) |
| `i$` / `a$`   | Contenuto / intera formula matematica |
| `ic` / `ac`   | Argomento / intero **c**omando (`\textbf{…}`) |
| `id` / `ad`   | Dentro / intera coppia di **d**elimitatori (`()`, `\left( \right)`) |

**Modifiche rapide**

| Tasto         | Cosa fa |
|---------------|---------|
| `dse` / `cse` | Elimina / cambia l'environment che circonda il cursore |
| `dsc` / `csc` | Elimina / cambia il comando che circonda il cursore |
| `ds$` / `cs$` | Elimina / cambia l'ambiente matematico che circonda il cursore |
| `tse`         | Alterna l'asterisco: `equation` ↔ `equation*` |
| `ts$`         | Alterna matematica in linea ↔ in display (`$…$` ↔ `\[…\]`) |
| `tsf`         | Alterna `\frac{a}{b}` ↔ `a/b` |
| `%`           | Salta tra `\begin` e `\end` (o tra parentesi corrispondenti) |
| `]]` (Insert) | Chiude l'environment o la parentesi aperta |

### UltiSnips

Uno **snippet** è un'abbreviazione che si espande in un blocco di testo con dei "campi" da compilare.

| Tasto (Insert) | Cosa fa |
|----------------|---------|
| `Ctrl-j`       | Espande lo snippet appena scritto, oppure salta al campo successivo |
| `Ctrl-k`       | Torna al campo precedente (solo dentro uno snippet) |

Quando un campo è evidenziato, scrivendo lo sostituisci; con `Ctrl-j` lo lasci com'è e vai avanti.

**I miei snippet LaTeX** (`~/.vim/UltiSnips/tex.snippets`): scrivi la parola e premi `Ctrl-j`

| Parola | Diventa | Campi (in ordine) |
|--------|---------|-------------------|
| `cod`  | `\begin{codice}[Codice]` … `\end{codice}` | titolo → codice |
| `def`  | `\begin{definizione}[Definizione]` … `\end{definizione}` | titolo → testo |
| `nota` | `\begin{nota}{Titolo}{Sottotitolo}` … `\end{nota}` | titolo → sottotitolo → testo |
| `ite`  | `\begin{itemize}` con il primo `\item` | testo del primo punto |
| `enu`  | `\begin{enumerate}` con il primo `\item` | testo del primo punto |

In `cod` il codice e `\end{codice}` partono sempre da inizio riga, anche se scrivi `cod` su una riga
indentata: listings stampa gli spazi iniziali, quindi il codice non risulta spostato nel PDF.

Per aggiungerne altri: da un file `.tex` lancia `:UltiSnipsEdit` (apre `tex.snippets`). Formato:

```
snippet def "Definizione (definizione)"
\begin{definizione}[${1:Definizione}]
	$0
\end{definizione}
endsnippet
```

`${1:Definizione}` è il primo campo con il testo predefinito, `$0` è dove finisce il cursore.
Per C vale lo stesso da un file `.c` (diventa `c.snippets`).

---

## 3. Impostazioni (cosa cambiano nel comportamento)

**Testo e indentazione** (`options.vim`)
- `Tab` inserisce **4 spazi** (mai caratteri tab veri); `Backspace` cancella 4 spazi alla volta
- `smartindent`: indenta automaticamente le nuove righe (es. dopo `{`)
- `showmatch`: quando chiudi una parentesi, il cursore lampeggia un attimo su quella che apre
- `backspace=indent,eol,start`: `Backspace` cancella liberamente indentazione, a-capo e testo già scritto
- Highlighting della sintassi e indentazione per tipo di file attivi
- I file `.tex` sono sempre trattati come LaTeX, anche se nuovi o senza `\documentclass`
  (servono a VimTeX e agli snippet; senza, Vim li considererebbe TeX semplice, `plaintex`)

**Aspetto**
- **Numeri di riga ibridi**: la riga corrente mostra il numero vero, le altre la distanza dal cursore (comodo per `5j`, `3dd`…)
- **Forma del cursore**: blocco in Normal, barra in Insert, sottolineato in Replace; torna barra quando esci da Vim
- Tema **GitHub Dark** con colori a 24 bit, barra di stato **lightline** sempre visibile
- La modalità (`-- INSERT --`) non viene scritta in fondo: la mostra già lightline
- Errori/warning LSP solo come segni nella colonna sinistra (colonna sempre visibile), niente testo in linea

---

## 4. Da sapere: conflitti e piccoli problemi

1. **Comandi nativi di Vim che hai sostituito**

   | Tasto        | Cosa faceva prima                      | Come ottenerlo ora |
   |--------------|----------------------------------------|--------------------|
   | `Ctrl-l`     | Ridisegna lo schermo                   | `:redraw!` |
   | `gd` / `gr`  | Definizione locale / sostituzione virtuale | raramente utili, nessun problema |

2. **Server LSP**: li registra tutti vim-lsp-settings da solo: `clangd` per il C (quello di sistema,
   `/usr/bin/clangd`), `texlab` per LaTeX e `marksman` per Markdown (questi due installati in
   `~/.local/share/vim-lsp-settings/servers/`). Per vedere quali sono attivi: `:LspStatus`.

3. **`Ctrl-Space`**: molti terminali (anche quello di Windows) lo inviano come `Ctrl-@`, che di suo in
   Insert reinserisce l'ultimo testo scritto ed esce dalla modalità Insert. Per questo in `clsp.vim`
   sono mappati entrambi (`<C-Space>` e `<C-@>`) sul menu dei suggerimenti.

4. **VimTeX e la versione di Vim**: questa versione di VimTeX chiede Vim 9.2, tu hai la 9.1. In
   `texlsp.vim` la riga `let g:vimtex_version_check = 0` salta il controllo; compilazione, PDF ed errori
   sono stati provati e funzionano. Se un giorno VimTeX desse errori strani, la causa probabile è questa.
   Aggiornando Vim alla 9.2 la riga si può togliere.
