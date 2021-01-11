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
command! -nargs=0 ReplaceA call EasyReplace('<','\>')

nnoremap <silent> ci( :ReplaceP<CR>
nnoremap <silent> ci[ :ReplaceB<CR>
nnoremap <silent> ci{ :ReplaceC<CR>
nnoremap <silent> ci< :ReplaceA<CR>

nnoremap <silent> ci) :ReplaceP<CR>
nnoremap <silent> ci] :ReplaceB<CR>
nnoremap <silent> ci} :ReplaceC<CR>
nnoremap <silent> ci> :ReplaceA<CR>

augroup YourFirstPlugin
    autocmd!
augroup END
