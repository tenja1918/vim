" vim: set fenc=utf-8 ft=vim :

" ==================================================================================================
" .vimrc
" ==================================================================================================
" ==================================================================================================

" --------------------------------------------------------------------------------------------------
" スクリプトローカル関数
" --------------------------------------------------------------------------------------------------
" get SID hacks
function! s:SID()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID$')
endfunction

" ファイルが存在すればsourceする
function! s:SourceIfExist(f) abort
  let l:fpath = expand(a:f)
  if filereadable(l:fpath)
    execute ':source ' . l:fpath
 endif
endfunction

" --------------------------------------------------------------------------------------------------
" エンコーディング関連
" --------------------------------------------------------------------------------------------------
" Vimがバッファに読み込むときのエンコーディング
set encoding=utf-8
" Vimがファイルに書き込むときのエンコーディング(未設定ならencodingに同じ)
set fileencoding=utf-8
" Vimがファイルを読み込むときに試すエンコーディングのリスト
" :e ++enc=cp932    <-- ちなみに文字コードを指定して再読み込みするときは、こう
set fileencodings=utf-8,cp932,utf-16le,sjis,euc-jp

" --------------------------------------------------------------------------------------------------
" 基本設定いろいろ
" --------------------------------------------------------------------------------------------------
" Viとの互換性は無し
set nocompatible

" ビジュアルベルを無効にする
set novisualbell
" エラーメッセージの表示のときも、ビープなし
set noerrorbells

" 構文ハイライトを使う(enable:現在の色設定を変更しない、on:現在の色設定を破棄してデフォルトの色設定にする)
" ハイライト設定に影響するので、出来るだけ最初のほうで指定したほうがよい
syntax enable

" モードラインを有効にする(vim: set fenc=utf-8 ft=vim :  <--ファイル中のこれ)
set modeline

" 行の折り返しは嫌いなので、デフォルトでは折り返さない
set nowrap
" 折り返したい場合は以下
"set wrap
" 1行の文字数がすごく多くても表示させる
" (set wrapされてないと意味がないだろうけど、たまにset wrapするので、そのとき用
set display=lastline

" 貼り付けるときの set paste, set paste! を <F5>でやる
"set pastetoggle=<F3>

" --------------------------------------------------------------------------------------------------
" インデント関連
" --------------------------------------------------------------------------------------------------
" TABを含むファイルを開いたとき、2つ分の文字幅として表示
set tabstop=2
" TABを押したときの、2つ分の文字幅として表示
set softtabstop=2
" タブ文字の変わりに、空白文字を入れる
set expandtab

" Vimが自動インデントするときの文字数
set shiftwidth=2

" 高度なインデント
set smartindent

" 1行あたりの文字数。0にすると勝手に改行しない
set textwidth=0

" 指定した文字数の列に色をつける
"set colorcolumn=160

" --------------------------------------------------------------------------------------------------
" Windows上で動作するVim関連
" --------------------------------------------------------------------------------------------------
"if has("win32")
"  " windowsライクなキーマップとか
"  source $VIMRUNTIME/mswin.vim
"
"  " Windowsでディレクトリパスの区切り文字に / が使えるようになる
"  set shellslash
"
"  " クリップボードをWindowsと連携
"  set clipboard=unnamed
"
"  " KaoriyaさんのVimを使っていたら、デフォルト設定を上書き
"  autocmd FileType * setlocal textwidth=0
"endif

" --------------------------------------------------------------------------------------------------
" バックアップ、UNDO、スワップファイル関連
" --------------------------------------------------------------------------------------------------
" バックアップファイルをつくらない
set nobackup
" UNDOファイルは以下のディレクトリにまとめて作成(xxx.un~    <-- こういうファイル)
set undodir=~/.vim/undo
" スワップファイルは以下のディレクトリにまとめて作成(xxx.swp    <-- こういうファイル)
set directory=~/.vim/swap

" --------------------------------------------------------------------------------------------------
" 色や見た目の設定
" --------------------------------------------------------------------------------------------------
" 行番号を表示
set number
" vim入力中のコマンドを表示
set showcmd
" カッコの入力時に、対応するカッコを表示
set showmatch
" showmatchする時間(= matchtime * 0.1 mills)
set matchtime=1
" ファイル名の補完モード(マッチするものをリスト表示し、最長部分まで補完し、TABを押すごとに補完)
set wildmode=list:longest,full
" ステータスライン下のメッセージ表示ラインの行数
set cmdheight=1
" カーソルラインを表示
set cursorline

" 見えない文字を可視化する
set list
" 可視化文字(tab:TAB、trail:行末に続く空白、extends:右に省略文字あり、precedes:左に省略文字あり、nbsp:不可視の空白、eol:改行)
set listchars=tab:>-,trail:_,extends:$,precedes:$,nbsp:%

" 全角空白(JISX0208)に色をつける(colorschemeのセットより前に行う。さもなくばターミナルでのvim起動時にエラーになる)
augroup hlZenSpace
  autocmd!
  autocmd Colorscheme * highlight ZenSpace ctermbg=Green guibg=DarkGreen
  autocmd VimEnter,WinEnter * match ZenSpace /　/
augroup END

" カラースキーマ
colorscheme molokai_dark


" 以下のハイライト設定はcolorschemeのセットより後に行う。さもなくば反映されない
" 行番号の色
highlight LineNr term=underline ctermfg=8 guifg=Gray60
" 現在行の行番号の色
highlight CursorLineNr term=bold ctermfg=2 guifg=Green
" カーソルラインの色
highlight CursorLine term=underline cterm=underline guibg=Black


" --------------------------------------------------------------------------------------------------
" ハイライト関連
" --------------------------------------------------------------------------------------------------
" 検索時のハイライト
set hlsearch
" .vimrcを再読み込みしたとき、ハイライトされていたら消す
if v:hlsearch == 1
  set nohlsearch
endif
" ESCを2回叩くとON、OFFトグル
nnoremap <ESC><ESC> :set hlsearch!<CR>

" terminalでもTrue Color(24bit)を使う
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" --------------------------------------------------------------------------------------------------
" ステータスライン
" --------------------------------------------------------------------------------------------------
"" ファイル名表示
"set statusline=\ %<%F
"
"" 変更チェック表示
"set statusline+=\ %m
"
"" 読み込み専用かどうか表示
"set statusline+=\ %r
"
"" ヘルプページなら[HELP]と表示
"set statusline+=\ %h
"
"" プレビューウインドウなら[Prevew]と表示
"set statusline+=\ %w
"
"" これ以降は右寄せ表示
"set statusline+=%=
"
"" file encoding
"set statusline+=\ [%{(&fenc!=''?&fenc:&enc)}%{&bomb=='1'?'(BOM)':''}]
"
"" 改行文字
"set statusline+=\ [%{&ff=='unix'?'LF':&ff=='dos'?'CRLF':&ff=='mac'?'CR':&ff}]
"
"" type
"set statusline+=\ [type:%Y]
"
"" ascii code
"set statusline+=\ [ascii:\%03.3b\ 0x%-4B]
"
"" 列位置
"set statusline+=\ [col:%-5v]
"
"" 現在行数/全行数(%)
"set statusline+=\ [row:%l/%L\ (%p%%)]
"
"" ステータスラインを(0:表示しない、1:2つ以上ウィンドウがある時だけ表示、2:常に表示)
"set laststatus=2

" --------------------------------------------------------------------------------------------------
" タブ関連
" --------------------------------------------------------------------------------------------------
" 常にタブラインを表示
set showtabline=2

" タブ操作のプレフィックス文字
nnoremap t <Nop>

" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" te 新しいタブで引数のファイルを開く。引数がなければ新規ファイル
nnoremap te :tabedit
" tc 新しいタブを一番右に作る
nnoremap tc :tablast <bar> tabnew<CR>
" tx タブを閉じる
nnoremap tx :tabclose<CR>
" tn 次のタブ
nnoremap tn :tabnext<CR>
" tp 前のタブ
nnoremap tp :tabprevious<CR>
" カーソル位置の単語から推測されるファイルを開く
nnoremap to <C-w>gf

" タブに番号をつける。guiとcliを共通化できないかな
if has("gui_running")
  " see: https://doruby.jp/users/aisi/entries/Vim__
  function! s:GuiTabLabel()
    " タブで表示する文字列の初期化をします
    let l:label = ''

    " タブに含まれるバッファ(ウィンドウ)についての情報をとっておきます。
    let l:bufnrlist = tabpagebuflist(v:lnum)

    " 表示文字列にバッファ名を追加します
    " パスを全部表示させると長いのでファイル名だけを使います 詳しくは help fnamemodify()
    let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
    " バッファ名がなければ No title としておきます。ここではマルチバイト文字を使わないほうが無難です
    let l:label .= l:bufname == '' ? 'No title' : l:bufname

    " タブ内にウィンドウが複数あるときにはその数を追加します(デフォルトで一応あるので)
    let l:wincount = tabpagewinnr(v:lnum, '$')
    if l:wincount > 1
      let l:label .= '[' . l:wincount . ']'
    endif

    " このタブページに変更のあるバッファがるときには '[+]' を追加します(デフォルトで一応あるので)
    for bufnr in l:bufnrlist
      if getbufvar(bufnr, "&modified")
        let l:label .= '[+]'
        break
      endif
    endfor

    " 表示文字列を返します
    return l:label
  endfunction

  " guitablabel に上の関数を設定します。その表示の前に %N というところでタブ番号を表示させています
  let &guitablabel = '%N: %{' . s:SID() . 'GuiTabLabel()}'

else

  " see: https://qiita.com/wadako111/items/755e753677dd72d8036d
  " Set tabline.
  function! s:MyTabLine()
    let s = ''
    for i in range(1, tabpagenr('$'))
      let bufnrs = tabpagebuflist(i)
      let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
      let no = i  " display 0-origin tabpagenr.
      let mod = getbufvar(bufnr, '&modified') ? '(+)' : ' '
      let title = fnamemodify(bufname(bufnr), ':t')
      let title = '[' . title . ']'
      let s .= '%'.i.'T'
      let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
      let s .= no . ':' . title
      let s .= mod
      let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
  endfunction
  let &tabline = '%!'. s:SID() . 'MyTabLine()'
endif

" --------------------------------------------------------------------------------------------------
" その他のgVim関連
" --------------------------------------------------------------------------------------------------
if has("gui_running")
  " ウィンドウサイズ
  set lines=60 columns=180

  " IMEをONにするとカーソルの色を変える
  if has('multi_byte_ime')
    highlight Cursor guibg=Yellow     " ime off
    highlight CursorIM guibg=Orange   " ime on
  endif
endif

" --------------------------------------------------------------------------------------------------
" その他のキーマップ関連
" --------------------------------------------------------------------------------------------------
" | MODE                  | NOREMAP  | REMAP |
" | normal + visual       | noremap  | map   |
" | normal                | nnoremap | nmap  |
" | visual                | vnoremap | vmap  |
" | insert                | inoremap | imap  |
" | command line          | cnoremap | cmap  |
" | command line + insert | noremap! | map!  |

" Leaderを設定
let mapleader="\<Space>"

" すべて選択
"inoremap <C-a> <NOP>
"inoremap <C-a> <ESC>ggVG
"nnoremap <C-a> ggVG
"vnoremap <C-a> ggVG

" .vimrcの再読み込み
nnoremap <Leader><Leader>sv :source ~/.vimrc<CR>

" タブ移動
noremap <Leader>h tp
noremap <Leader>l tn

" 横スクロール
" 左へ
noremap <Leader>> zL
" 右へ
noremap <Leader>< zH

" 数字のインクリメント / デクリメント
noremap + <C-a>
noremap - <C-x>

" 貼り付けたテキストを選択する
"noremap gV `[v`]l

" 英語キーボードだと : はshiftが必要なのでめんどい。 ; にする
"nnoremap ; :

" 強制終了。このほうが打ちやすい
nnoremap <Leader>qq :q!<CR>

" --------------------------------------------------------------------------------------------------
" プラグイン関連
" --------------------------------------------------------------------------------------------------
" vim-plugでプラグイン管理を行う場合の設定
" vim-plug自体のインストールは公式サイトを参照
" vim-plugをインストール直後は、:PlugUpdateが必要

" ファイルタイプの自動検出、ファイルタイプ用のプラグインとインデント設定を自動読み込み
filetype plugin indent on

"if has("win32")
"  " プラグインのパスを指定(unix風に)
"  set runtimepath+=~/.vim,~/.vim/after
"end

" プラグインのインストール
call plug#begin(expand('~/.vim/plugged'))
" NERDTreeファイラー
"Plug 'scrooloose/nerdtree'
" いろいろなカラースキームをまとめたもの
"Plug 'flazz/vim-colorschemes'
" 入力補完
Plug 'Shougo/neocomplcache'
" スニペット
"Plug 'Shougo/neosnippet'
" スニペット定義いろいろ
"Plug 'Shougo/neosnippet-snippets'

" colorscheme
"Plug 'fcevado/molokai_dark', { 'do': 'cp -p colors/* ~/.vim/colors/' }
Plug 'raphamorim/lucario', { 'do': 'cp -p colors/* ~/.vim/colors/' }

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'https://github.com/powerline/fonts.git', { 'as': 'powerline-fonts', 'do': 'powershell -File install.ps1 \"Roboto Mono*\"' }

" NrrwRgn
Plug 'chrisbra/NrrwRgn'

call plug#end()

" プラグイン個別の設定
"call s:SourceIfExist('~/.vim/plugin_config/nerdtree.vim')
"call s:SourceIfExist('~/.vim/plugin_config/neocomplcache.vim')
"call s:SourceIfExist('~/.vim/plugin_config/neosnipet.vim')
call s:SourceIfExist('~/.vim/plugin_config/vim-airline.vim')

" --------------------------------------------------------------------------------------------------
" ローカル設定用のvimrcがあれば読み込む
" --------------------------------------------------------------------------------------------------
call s:SourceIfExist('~/.local/vimrc.local')

