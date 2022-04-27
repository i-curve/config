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


"Set the Map
let mapleader=","
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>
inoremap kk <Esc>
vnoremap kk <Esc>
inoremap jj <Esc>:w<cr>a
"jump cursor
"inoremap <C-CR> <Esc>
"inoremap <C-S-CR> <Esc>O

"This is the plug: vim-plug
"********************The basic pulgin****************
call plug#begin('~/.vim/plugged')
"*****************Basic****************************
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'Yggdroot/indentLine'
"Plug 'w0ng/vim-hybrid'
"Plug 'suxpert/vimcaps'
"****************Highing **********************************
Plug 'easymotion/vim-easymotion'

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-commentary'
Plug 'lfv89/vim-interestingwords'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'

Plug 'majutsushi/tagbar'
"Plug 'kannokanno/previm'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"******************Git******************************
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
"******************Write code************************
""Formar-> neoformat
Plug 'sbdchd/neoformat'
" asynctask
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
"auto complete the code
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
"
"GOLAND-> faith-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"PYTHON-> python-mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'yyzybb/cppenv'
"C++-> cland_complete
Plug 'xavierd/clang_complete'
Plug 'Valloric/YouCompleteMe'
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
nnoremap <leader>g :NERDTreeToggle<cr>

nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>f :NERDTreeCWD<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '__pycache__', '\.ropeproject', '\.swp$']

"delimitMate
set backspace=start,eol
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

set updatetime=100

" markdowm
let g:vim_markdown_fenced_languages = ['csharp=cs','c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini','py=py']
let g:vim_markdown_folding_disabled = 1
"set nofoldenable
set conceallevel=2
let g:vim_markdown_auto_extension_ext = 'MD'

"deoplete.nvim
" let g:deoplete#enable_at_startup = 1
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
"format->Neoformat
augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END
" let g:neoformat_python_autopep8 = {
"             \ 'exe': 'autopep8',
"             \ 'args': ['-s 4', '-E'],
"             \ 'replace': 1,
"             \ 'stdin': 1, 
"             \ 'env': ["DEBUG=1"],
"             \ 'valid_exit_codes': [0, 23],
"             \ 'no_append': 1,
"             \ }
let g:neoformat_enabled_python = ['autopep8']
let g:shfmt_opt="-ci"
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
let g:pymode_run_bind = '<leader>r'
"
"C++->clang-complete
let g:clang_library_path='/usr/lib/llvm-10/lib/libclang-10.so.1'
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
