if has('win16') || has('win32') || has('win64')
    if has('nvim')
        call materia#init($HOME . '/AppData/Local/nvim')
    else
        call materia#init($HOME . '/vimfiles')
    endif
else
    if has('nvim')
        call materia#init($HOME . '/.config/nvim')
    else
        call materia#init($HOME . '/.vim')
    endif
endif
