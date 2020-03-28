set number
set showcmd
set cursorline
set smartindent
set hlsearch
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
nnoremap j gj
nnoremap k gk

" yank to end 
nnoremap Y y$

set ignorecase
set incsearch
set wrapscan
colorscheme molokai
set t_Co=256
set background=dark
set belloff=all

inoremap <silent> jj <ESC>

" status line
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[ROW=%l/%L]

