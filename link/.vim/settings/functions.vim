" Vim functions

" Trim extra whitespace
function! StripExtraWhiteSpace()
  let l = line(".")
    let c = col(".")
      %s/\s\+$//e
        call cursor(l, c)
        endfunction
