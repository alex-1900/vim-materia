"=============================================================================
" FILE: packages.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:app_system = materia#dependence#get('app#system')

" Select gui font by system informations.
" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip
function! materia#strategies#guifont()
  let name = has('nvim') ? 'SauceCodePro\ Nerd\ Font\ Mono' : 'SauceCodePro_Nerd_Font_Mono'
  let size = s:app_system.is_windows ? ':h13' : ':h14'
  return name . size
endfunction

" Set python enviroment by config.json
function! materia#strategies#set_pythonenv()
  if has('nvim')
    let python_host_prog = materia#conf('options.python.python_host_prog')
    if type(python_host_prog) == type('') | let g:python_host_prog = python_host_prog | endif
    let python3_host_prog = materia#conf('options.python.python3_host_prog')
    if type(python3_host_prog) == type('') | let g:python3_host_prog = python3_host_prog | endif
  endif
endfunction
