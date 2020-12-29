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
    let g:python_host_prog = materia#conf('options.python.python_host_prog')
    let g:python3_host_prog = materia#conf('options.python.python3_host_prog')
  else
    let pythonhome = materia#conf('options.python.pythonhome')
    if type(pythonhome) == type('') | execute "set pythonhome=". fnameescape(pythonhome) | endif

    let pythonthreehome = materia#conf('options.python.pythonthreehome')
    if type(pythonthreehome) == type('') | execute "set pythonthreehome=". fnameescape(pythonthreehome) | endif

    let pythondll = materia#conf('options.python.pythondll')
    if type(pythondll) == type('') | execute "set pythondll=". fnameescape(pythondll) | endif

    let pythonthreedll = materia#conf('options.python.pythonthreedll')
    if type(pythonthreedll) == type('') | execute "set pythonthreedll=". fnameescape(pythonthreedll) | endif
  endif
endfunction
