fun! EasyReplace(first,second)
    " dont forget to remove this one....
    " echo a:first
    let g:first = a:first
    let g:second = a:second
    lua for k in pairs(package.loaded) do if k:match("^easy%-replace") then package.loaded[k] = nil end end
    lua require("easy-replace").easyReplace()
endfun

command! -nargs=0 ReplaceP call EasyReplace('(',')')
command! -nargs=0 ReplaceB call EasyReplace('[',']')
command! -nargs=0 ReplaceC call EasyReplace('{','}')

nnoremap ci( :ReplaceP<CR>
nnoremap ci[ :ReplaceB<CR>
nnoremap ci{ :ReplaceC<CR>

augroup YourFirstPlugin
    autocmd!
augroup END
