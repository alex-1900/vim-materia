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

" Process [normal] part
function! materia#strategies#part_tag_normal(name, part, plug_installer)
  let part = a:part
  if (has_key(part, 'condition') && part.condition()) || !has_key(part, 'condition')
    if HasPlug(part.directory)
      let execute_vim_enter =  'autocmd VimEnter * nested call materia#part#get("'. a:name .'").loader()'
      if has_key(part, 'preloader')   | call part.preloader() | endif
      if has_key(part, 'loader') | execute execute_vim_enter | endif
    endif
    if has_key(part, 'installer')  | call part.installer(a:plug_installer) | endif
  endif
endfunction

" Process [theme] part
let s:current_colorscheme = materia#conf('options.colorscheme')
function! materia#strategies#part_tag_theme(name, part, plug_installer)
  let part = a:part
  if (has_key(part, 'condition') && part.condition()) || !has_key(part, 'condition')
    if s:current_colorscheme == part.key
      if HasPlug(part.directory)
        let execute_vim_enter =  'autocmd VimEnter * nested call materia#part#get("'. a:name .'").loader()'
        if has_key(part, 'preloader')   | call part.preloader() | endif
        if has_key(part, 'loader') | execute execute_vim_enter | endif
      endif
    endif
  endif
  call materia#part#bind_theme(part.directory, a:name)
  if has_key(part, 'installer')  | call part.installer(a:plug_installer) | endif
endfunction
