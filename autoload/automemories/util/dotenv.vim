"=============================================================================
" FILE: dotenv.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

" load an dotenv file
function! automemories#util#dotenv#load(file, ...) abort
  let file = a:file
  let lines = []
  for line in readfile(file)
    let matches = matchlist(line, '\v\C^%(export\s+)=([[:alnum:]_.]+)%(\s*\=\s*|:\s{-})(''%(\\''|[^''])*''|"%(\\"|[^"])*"|[^#]+)=%( *#.*)?$')
    if !empty(matches)
      call add(lines, matches[1:2])
    endif
  endfor
  let env = a:0 ? a:1 : {}
  for [key, value] in lines
    if !has_key(env, key)
      if value =~# '^\s*".*"\s*$'
        let value = substitute(value, '\n', "\n", 'g')
        let value = substitute(value, '\\\ze[^$]', '', 'g')
      endif
      let value = substitute(value, '^\s*\([''"]\)\=\(.\{-\}\)\1\s*$', '\2', '')
      let value = substitute(value, '\\\=\${.\{-\}}\|\\\=\$\w\+', '\=s:lookup(submatch(0), env)', 'g')
      let env[key] = value
    endif
  endfor
  return env
endfunction
