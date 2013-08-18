set nocompatible
colorscheme desert
syntax on
filetype off
filetype plugin indent off

""base
set autoindent
set ignorecase
set smartcase
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile
set showmatch
set ruler
set number
set list
set listchars=tab:>-,eol:$
set splitbelow

"" key mapping
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap <> <><LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap `` ``<LEFT>
""inoremap <C-h> <LEFT>
""inoremap <C-j> <DOWN>
""inoremap <C-k> <UP>
""inoremap <C-l> <RIGHT>
inoremap <C-u> <UNDO>

nnoremap <silent> <C-x>1 :only<CR>
nnoremap <silent> <C-x>2 :sp<CR>
nnoremap <silent> <C-x>3 :vsp<CR>


"" ファイルの前回閉じたときの場所を記憶
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line ("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

"" Skelton
augroup SkeltonAu
    autocmd!
    autocmd BufNewFile *.html 0read $HOME/.vim/skelton/skel.html
    autocmd BufNewFile *.pl 0read $HOME/.vim/skelton/skel.pl
    autocmd BufNewFile *.php 0read $HOME/.vim/skelton/skel.php
    autocmd BufNewFile *.sh 0read $HOME/.vim/skelton/skel.sh
augroup END

""全角スペース表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
autocmd BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
autocmd WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

""ステータスライン
if has('iconv')
    set statusline=%F%m%r%h%w\ %{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\
else
    set statusline=%F%m%r%h%w\ [ASCII=\%03.3B]\[POS=%04l.%04v\ %p%%]\[LEN=%L]
endif
function! FencB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return s:Byte2hex(s:Str2byte(c))
endfunction
function! s:Str2byte(str)
    return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction
function! s:Byte2hex(bytes)
    return join(map(copy(a:bytes), 'printf("%02x", v:val)'), '')
endfunction
set laststatus=2

"" プラグイン
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'

"" quickrun
let g:quickrun_config={'*': {'hook/time/enable': '1'},}

"" syntastic
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1

"" neocomplcache, neosnippet
set completeopt=menuone
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_under_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '*ku*'
let g:neocomplcache_max_list = 15
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippet'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

"" unite
filetype plugin indent on
