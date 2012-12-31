set nocompatible
filetype off

""" plugin
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'

filetype plugin indent on
filetype indent on
syntax on

""" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_min_keyword_length = 4
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case  = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 0
let g:neocomplcache_temporary_dir = '/tmp/.neocon'

"snippet dir
let g:neocomplcache_snippets_dir = "~/.vim/snippet"
"dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'perl'    : $HOME . '/.vim/dict/perl.dict',
    \ 'php'     : $HOME . '/.vim/dict/php.dict'
    \ }
"ctags
"keyword
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns={}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"omni
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

""" unite
let g:unite_enable_start_insert = 0
noremap <C-U><C-B> :Unite buffer<CR>
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
noremap <C-U><C-R> :Unite file_mru<CR>
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
noremap <C-U><C-U> :Unite buffer file_mru<CR>
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

""" base
set autoindent
set ignorecase
set smartcase
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile
set clipboard=unnamed,autoselect
set completeopt=menuone
set ruler
set showmatch

""" keymapping
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
imap "" ""<LEFT>
imap '' ''<LEFT>
imap <> <><LEFT>
