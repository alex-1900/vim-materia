"=============================================================================
" FILE: strategies.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:app_system = materia#service#get('system')
let s:service_theme = materia#service#get('theme')

" Select gui font by system informations.
" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip
function! materia#strategies#guifont()
  let name = has('nvim') ? 'SauceCodePro\ Nerd\ Font\ Mono' : 'SauceCodePro_Nerd_Font_Mono'
  let size = s:app_system.is_windows ? ':h13' : ':h14'
  return name . size
endfunction

" Process [normal] part
function! materia#strategies#part_tag_normal(part, plug_installer)
  let part = a:part
  if (has_key(part, 'condition') && part.condition()) || !has_key(part, 'condition')
    if HasPlug(part.directory)
      call s:active_part(part)
    endif
    if has_key(part, 'installer')  | call part.installer(a:plug_installer) | endif
  endif
endfunction

" Process [theme] part
let g:current_colorscheme = materia#config#get('options.colorscheme')
function! materia#strategies#part_tag_theme(part, plug_installer)
  let part = a:part
  call s:service_theme.add(a:part.id)
  if (has_key(part, 'condition') && part.condition()) || !has_key(part, 'condition')
    if type(g:current_colorscheme) == type('') && g:current_colorscheme == part.id && HasPlug(part.directory)
      call s:active_part(part)
      let s:service_theme.current_theme_id = part.id
    endif
  endif
  if has_key(part, 'installer')  | call part.installer(a:plug_installer) | endif
endfunction

" Active a part
function! s:active_part(part)
  let execute_vim_enter =  'autocmd VimEnter * nested call materia#part#get("'. a:part.id .'").loader()'
  if has_key(a:part, 'preloader')   | call a:part.preloader() | endif
  if has_key(a:part, 'loader') | execute execute_vim_enter | endif
endfunction
