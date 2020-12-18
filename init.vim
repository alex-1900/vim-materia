if automemories#platform#is_windows()
    if automemories#platform#nvim()
        call automemories#init($HOME . '/AppData/Local/nvim')
    else
        call automemories#init($HOME . '/vimfiles')
    endif
else
    if automemories#platform#nvim()
        call automemories#init($HOME . '/.config/nvim')
    else
        call automemories#init($HOME . '/.vim')
    endif
endif
