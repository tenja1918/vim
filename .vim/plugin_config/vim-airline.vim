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
let g:airline_powerline_fonts = 0

"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#whitespace#mixed_indent_algo = 1

" テーマ
let g:airline_theme = 'dark'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

