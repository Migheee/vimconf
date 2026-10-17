let s:plugin_dir = expand('~/.vim/plugged')

function! s:ensure(repo)
  let name = split(a:repo, '/')[-1]
  let path = s:plugin_dir . '/' . name

  if !isdirectory(path)
    if !isdirectory(s:plugin_dir)
      call mkdir(s:plugin_dir, 'p')
    endif
    execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)
  endif

  " ^= mette il plugin prima dei file di Vim: altrimenti il supporto TeX di Vim si carica
  " per primo e VimTeX (ftplugin/indent/syntax) si disattiva da solo
  execute 'set runtimepath^=' . fnameescape(path)
  if isdirectory(path . '/after')
    execute 'set runtimepath+=' . fnameescape(path . '/after')
  endif
endfunction

call s:ensure("wojciechkepka/vim-github-dark")
call s:ensure("junegunn/fzf")
call s:ensure("junegunn/fzf.vim")
call s:ensure("prabirshrestha/vim-lsp")
call s:ensure("mattn/vim-lsp-settings")
call s:ensure("prabirshrestha/asyncomplete.vim")
call s:ensure("prabirshrestha/asyncomplete-lsp.vim")
call s:ensure("itchyny/lightline.vim")
call s:ensure("lervag/vimtex")
call s:ensure("SirVer/ultisnips")

" UltiSnips su Ctrl-j (espandi o salta al campo successivo), così Tab resta al menu di completamento
let g:UltiSnipsExpandTrigger = "<c-j>"
