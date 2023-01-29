" vim: set fenc=utf-8 ft=vim :

" ==================================================================================================
" Vim plugin: vim-airline
" ==================================================================================================
" 1. powerline/fontsの取得は.vimrc中のvim-plugにより、自動取得されるので、手動では不要。
" or
" > git clone https://github.com/powerline/fonts.git ~/git.d/powerline-fonts
"
" 2. フォントのインストールは.vimrc中のvim-plugにより、Roboto Mono*が自動インストールされるので、手動では不要。
" or
"   > ~/git.d/powerline-fonts/install.sh [引数で指定したフォント]
" or
"   > ~/git.d/powerline-fonts/install.ps1 [引数で指定したフォント]

" Powerline系フォントの利用
let g:airline_powerline_fonts = 1

" テーマ
let g:airline_theme = 'molokai'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" タブ
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" unicode symbols
" see: https://qiita.com/park-jh/items/5f796eec85d5ab272136
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" old vim-powerline symbols
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'

