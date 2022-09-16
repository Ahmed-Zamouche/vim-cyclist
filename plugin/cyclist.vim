let s:DEBUG = v:false

if exists('g:loaded_cyclist') && !s:DEBUG
  finish
endif

let g:loaded_cyclist = v:true

call cyclist#add_listchar_option_set('limited', {
        \ 'eol': '↲',
        \ 'tab': '» ',
        \ 'trail': '·',
        \ 'extends': '<',
        \ 'precedes': '>',
        \ 'conceal': '┊',
        \ 'nbsp': '␣',
        \ })

call cyclist#add_listchar_option_set('busy', {
        \ 'eol': '↲',
        \ 'tab': '»·',
        \ 'space': '␣',
        \ 'trail': '-',
        \ 'extends': '☛',
        \ 'precedes': '☚',
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ })

" TRAIL U+2591
call cyclist#set_trail('default', '░')
set nolist

nnoremap <Plug>CyclistNext :call cyclist#next_listchars()<CR>
nnoremap <Plug>CyclistPrev :call cyclist#prev_listchars()<CR>
nnoremap <Plug>CyclistActivate :call cyclist#activate_listchars('default')<CR>

" Reload the plugin
nnoremap <Leader>ca <Plug>CyclistActivate
nnoremap <Leader>cn <Plug>CyclistNext
nnoremap <Leader>cp <Plug>CyclistPrev


command CyclistNext call cyclist#next_listchars()
command CyclistPrev call cyclist#prev_listchar()
command -nargs=* CyclistActivate call cyclist#activate_listchars(<f-args>)
command CyclistOptsName call cyclist#opts_name_get()
