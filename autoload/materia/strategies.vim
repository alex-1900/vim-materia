"=============================================================================
" FILE: strategies.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:app_system = materia#service#get('system')

" Select gui font by system informations.
" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip
function! materia#strategies#guifont()
  let name = has('nvim') ? 'SauceCodePro\ Nerd\ Font\ Mono' : 'SauceCodePro_Nerd_Font_Mono'
  let size = s:app_system.is_windows ? ':h13' : ':h14'
  return name . size
endfunction

" Process [normal] package
function! materia#strategies#package_tag_normal(name, package, plug_installer, without_condition)
  let package = a:package
  if ((has_key(package, 'condition') && package.condition()) || !has_key(package, 'condition')) || without_condition
    if HasPlug(package.name)
      let execute_vim_enter =  'autocmd VimEnter * nested call materia#packages#get("'. a:name .'").loader()'
      if has_key(package, 'preloader')   | call package.preloader() | endif
      if has_key(package, 'loader') | execute execute_vim_enter | endif
    endif
    if has_key(package, 'installer')  | call package.installer(a:plug_installer) | endif
  endif
endfunction

" Process [theme] package
function! materia#strategies#package_tag_theme(name, package, plug_installer, without_condition)
  let package = a:package
  if ((has_key(package, 'condition') && package.condition()) || !has_key(package, 'condition')) || without_condition
    if HasPlug(package.name)
      let execute_vim_enter =  'autocmd VimEnter * nested call materia#packages#get("'. a:name .'").loader()'
      if has_key(package, 'preloader')   | call package.preloader() | endif
      if has_key(package, 'loader') | execute execute_vim_enter | endif
    endif
  endif
  call materia#packages#bind_theme(package.name, a:name)
  if has_key(package, 'installer')  | call package.installer(a:plug_installer) | endif
endfunction
