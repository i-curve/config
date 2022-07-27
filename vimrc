"This is the annotation
"********************Basic setting*******************
set nocompatible
"Set the Row Number
set number
syntax on
colorscheme desert
set termencoding=utf-8

set hlsearch
set incsearch
set ignorecase

set smartindent
set ts=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype js setlocal ts=2 sw=2 expandtab

"Set the Map
let mapleader=","
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>
inoremap kk <Esc>
vnoremap kk <Esc>
inoremap jj <Esc>:w<cr>a

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"This is the plug: vim-plug
"********************The basic pulgin****************
call plug#begin('~/.vim/plugged')
"*****************Basic****************************
Plug 'mhinz/vim-startify'           " vim 开屏工具
Plug 'vim-airline/vim-airline'      " vim 底部状态栏
Plug 'vim-airline/vim-airline-themes'   " vim 底部工具栏
Plug 'altercation/vim-colors-solarized' " vim 配色主题
Plug 'Yggdroot/indentLine'          " 代码缩进线
"Plug 'w0ng/vim-hybrid'             " vim 配色主题
"Plug 'suxpert/vimcaps'
"****************Highing **********************************
Plug 'easymotion/vim-easymotion'    " ss 快速文件定位
Plug 'scrooloose/nerdtree'          " 文件目录
Plug 'kien/ctrlp.vim'               " ctrl+p 搜索文件
Plug 'tpope/vim-commentary'         " gc文件注释
Plug 'lfv89/vim-interestingwords'   " ,+k 关键字高亮
Plug 'tpope/vim-surround'           " 对称字符添加
Plug 'Raimondi/delimitMate'         " 标点符号配对
Plug 'majutsushi/tagbar'            " 函数和类目录
"Plug 'kannokanno/previm'           " 文件预览, 类似markdown
Plug 'godlygeek/tabular'            " tab 对齐
Plug 'plasticboy/vim-markdown'
"******************Git******************************
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
"******************Write code************************
""Formar-> neoformat
"Plug 'sbdchd/neoformat'             " 格式化程序
Plug 'vim-autoformat/vim-autoformat'
" asynctask
Plug 'skywind3000/asynctasks.vim'   " 自动运行c++
Plug 'skywind3000/asyncrun.vim'     " 自动运行程序
"GOLAND-> faith-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go 语言组件
"PYTHON-> python-mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }    " pythoon 组件
Plug 'yyzybb/cppenv'            " c++组件
"C++-> cland_complete
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 通用代码补全
Plug 'xavierd/clang_complete'   " c++自动补全
Plug 'Valloric/YouCompleteMe'   " 自动补全
call plug#end()

" asynctask
let g:asyncrun_open = 6
noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
noremap <silent><f6> :AsyncTask project-run<cr>
noremap <silent><f7> :AsyncTask project-build<cr>

"Set the Map in Plug
nmap ss <Plug>(easymotion-s2)
nnoremap <leader>b :IndentLinesToggle<cr>

" nerdtree
nnoremap <leader>g :NERDTreeToggle<cr>
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>f :NERDTreeCWD<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['node_modules','\.git$', '__pycache__', '\.ropeproject', '\.swp$', '.vscode']

"delimitMate
set backspace=start,eol
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
nnoremap <leader>j :DelimitMateSwitch<cr>

set updatetime=100

" markdowm
let g:vim_markdown_fenced_languages = ['csharp=cs','c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini','py=py']
let g:vim_markdown_folding_disabled = 1
"set nofoldenable
set conceallevel=2
let g:vim_markdown_auto_extension_ext = 'MD'

" set completeopt-=preview
"
" ctrlp
let g:ctrlp_working_path_mode = 'cra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
" interesting
let g:interestingWordsRandomiseColors = 1
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']

"tagbar
nnoremap <leader>t :TagbarToggle<CR>
"*******************************Write code**************************
"format->autoformat
au BufWrite * :Autoformat
let g:autoformat_verbosemode=1
"format->Neoformat
" Enable alignment
" let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
" let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
" let g:neoformat_only_msg_on_error = 1
" let b:neoformat_run_all_formatters = 0
" augroup fmt
"     autocmd!
"     autocmd BufWritePre * undojoin | Neoformat
" augroup END
" let g:neoformat_python_autopep8 = {
"             \ 'exe': 'autopep8',
"             \ 'args': ['-s 4', '-E'],
"             \ 'replace': 1,
"             \ 'stdin': 1,
"             \ 'env': ["DEBUG=1"],
"             \ 'valid_exit_codes': [0, 23],
"             \ 'no_append': 1,
"             \ }
" let g:neoformat_enabled_python = ['autopep8']
" let g:neoformat_enabled_javascript = ['prettier','prettierd']
" let g:shfmt_opt="-ci"
" go
nnoremap <F3> :GoRun<cr>
"Python->  python-mode
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_rope = 1
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
let g:pymode_doc=1
let g:pymode_doc_bind='K'
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_on_unmodified=0
let g:pymode_lint_on_fly=0
let g:pymode_lint_checkers = ['pylint', 'pyflakes']
let g:pymode_lint_ignore = ['C','W0107']
let g:pymode_options_max_line_length=120
let g:pymode_run = 1
let g:pymode_run_bind = '<F4>'
"C++->clang-complete
let g:clang_library_path='/usr/lib/llvm-12/lib/libclang-12.so.1'
let g:clang_complete_auto=0
let g:clang_user_options='-std=c++20'
" let g:clang_compilation_database='build'
" let g:clang_auto_user_options="compile_commands.json, build"
set backspace=2
"C++->YouCompleteMe
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
let g:ycm_path_to_python_interpreter='/opt/anaconda3/bin/python'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"上下左右键行为"
inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'
