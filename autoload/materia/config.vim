"=============================================================================
" FILE: config.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================
scriptencoding utf-8

if exists('g:materia_config_loaded')
  finish
endif
let g:materia_config_loaded = 1

let s:config = {}

let s:default_config = json_decode(join(readfile(g:materia#path#home . '/config.default.json'), "\n"))

if filereadable(g:materia#path#home . '/config.json')
  let s:config = json_decode(join(readfile(g:materia#path#home . '/config.json'), "\n"))
endif

" Load system environments from config file
function! materia#config#load_environments()
  if exists('s:config.environment') &&
    \ type(s:config.environment) == type({})
    for env in keys(s:config.environment)
      execute 'let $'. env . '=' . s:config.environment[env]
    endfor
  endif
endfunction

" Get configure
" Priority return custom option and `dict` type options will be merged
function! materia#config#get(name)
  if exists('s:default_config.' . a:name)
    execute 'let result_default = s:default_config.' . a:name
    if exists('s:config.' . a:name)
      execute 'let result_custom = s:config.' . a:name
      if type(result_default) == type({})
        return extend(result_default, result_custom)
      endif
      return result_custom
    endif
    return result_default
  endif
  return 0
endfunction
