# I miei comandi Vim

<!-- Per rigenerare il PDF da stampare: cd ~/.vim && pandoc -d stampa-comandi.yaml -->

## Come leggere questa guida

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `<Space>`                 | tasto Spazio: il *leader*, da cui partono le mie scorciatoie            |
| `\`                       | backslash: il *localleader*, usato da VimTeX nei file `.tex`            |
| `Ctrl-x`                  | tieni premuto Ctrl e premi x                                            |
| `gd`  `<Space>ff`         | tasti uno dopo l'altro, senza fermarsi più di un secondo                |
| `:Comando`                | scrivi il comando dopo i due punti e premi Invio                        |

**Modalità.** *Normal* per comandi e movimenti (`Esc`), *Insert* per scrivere (`i`), *Visual* per
selezionare (`v`). Dove non è indicato, i tasti valgono in Normal.

**Operatori.** `d` cancella, `c` cambia, `y` copia, `v` seleziona. Si combinano con un oggetto di
testo: `diw` cancella la parola sotto il cursore.

## 1. In tutti i file

### Testo tra virgolette

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `div`  `dav`              | cancella dentro le virgolette / anche le virgolette                     |
| `civ`                     | riscrive il testo dentro le virgolette                                  |
| `yiv`                     | copia il testo dentro le virgolette                                     |
| `viv`                     | seleziona il testo dentro le virgolette                                 |

### File e ricerca

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `<Space>cd`               | file explorer nella cartella del file                                   |
| `<Space>ff`               | cerca un file per nome                                                  |
| `<Space>fo`               | file aperti di recente                                                  |
| `<Space>fb`               | file già aperti                                                         |
| `<Space>fg`               | cerca un testo dentro i file                                            |
| `:BLines`                 | cerca tra le righe del file                                             |
| `:Maps`                   | cerca tra tutte le scorciatoie                                          |

#### Nelle finestre di ricerca

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `Ctrl-j`  `Ctrl-k`        | giù / su                                                                |
| `Invio`                   | apre                                                                    |
| `Ctrl-v`  `Ctrl-x`        | apre in divisione verticale / orizzontale                               |
| `Ctrl-t`                  | apre in una nuova tab                                                   |
| `Tab`                     | seleziona più risultati                                                 |
| `Esc`                     | chiude                                                                  |

#### Nel file explorer

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `Invio`                   | apre                                                                    |
| `-`                       | cartella superiore                                                      |
| `%`  `d`                  | nuovo file / nuova cartella                                             |
| `D`  `R`                  | elimina / rinomina                                                      |
| `gh`                      | mostra / nasconde i file nascosti                                       |

### Completamento (Insert)

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `Tab`  `Shift-Tab`        | voce successiva / precedente                                            |
| `Ctrl-y`                  | conferma la voce                                                        |
| `Ctrl-e`                  | chiude il menu                                                          |
| `Ctrl-Space`              | apre subito il menu                                                     |

## 2. Nei file C

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `gd`                      | vai alla definizione                                                    |
| `gr`                      | elenca dove è usato                                                     |
| `K`                       | tipo e documentazione                                                   |
| `<Space>rn`               | rinomina in tutto il progetto                                           |
| `<Space>=`                | reindenta tutto il file                                                 |
| `Ctrl-l`                  | apre / chiude la lista errori                                           |
| `Ctrl-o`  `Ctrl-i`        | indietro / avanti dopo un salto                                         |

#### Nella lista errori

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `Invio`                   | salta all'errore                                                        |
| `:lnext`  `:lprev`        | errore successivo / precedente                                          |

#### Comandi utili

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `:LspCodeAction`          | correzioni rapide                                                       |
| `:LspDocumentFormat`      | formatta il file                                                        |
| `:LspStatus`              | server LSP attivi                                                       |

## 3. Nei file LaTeX

### Compilare

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `<Space>za`               | salva e compila                                                         |
| `\ll`                     | compila a ogni salvataggio (di nuovo per fermare)                       |
| `\lk`                     | ferma la compilazione                                                   |
| `Ctrl-l`                  | apre / chiude errori e warning                                          |
| `\lc`                     | cancella i file ausiliari                                               |
| `\lt`                     | indice del documento                                                    |

#### Nella lista errori

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `Invio`                   | salta al punto                                                          |
| `:cnext`  `:cprev`        | successivo / precedente                                                 |

### Snippet (Insert: scrivi la parola, poi Ctrl-j)

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `cod`                     | blocco codice                                                           |
| `def`                     | blocco definizione                                                      |
| `nota`                    | blocco nota                                                             |
| `ese`                     | blocco esempio                                                          |
| `ite`  `enu`              | elenco puntato / numerato                                               |
| `Ctrl-b`                  | nuovo environment: il nome scritto nel \\begin si copia nell'\\end      |
| `Ctrl-j`  `Ctrl-k`        | campo successivo / precedente                                           |

### Oggetti di testo (dopo d, c, y, v)

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `ie`  `ae`                | contenuto / intero environment                                          |
| `i$`  `a$`                | contenuto / intera formula                                              |
| `ic`  `ac`                | nome del comando / intero comando                                       |
| `id`  `ad`                | dentro / intere parentesi                                               |

### Modifiche rapide

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `dse`  `cse`              | elimina / cambia l'environment intorno                                  |
| `dsc`  `csc`              | elimina / cambia il comando intorno                                     |
| `ds$`  `cs$`              | elimina / cambia la formula intorno                                     |
| `tse`                     | equation / equation*                                                    |
| `ts$`                     | formula in linea / in display                                           |
| `tsf`                     | \\frac{a}{b} / a/b                                                       |
| `%`                       | salta tra \\begin e \\end                                                 |
| `]]`                      | (Insert) chiude l'environment aperto                                    |

## 4. Nei file Markdown

|                           |                                                                         |
|---------------------------|-------------------------------------------------------------------------|
| `<Space>m`                | anteprima formattata (`:q` chiude)                                      |
