" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Plug 'python-rope/ropevim'
Plug 'tomasiser/vim-code-dark'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
" Plug 'majutsushi/tagbar'
" Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
Plug 'ycm-core/YouCompleteMe'
" 添加注释插件,默认快捷键为<leader>+cc/cu
Plug 'scrooloose/nerdcommenter'


" Initialize plugin system
call plug#end()
filetype plugin indent on
"
"
" Theme options
" set t_Co=256
" colorscheme Monokai
colorscheme codedark

" 记录光标位置
" Only do this part when compiled with support for autocommands.
if has("autocmd")
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
else
set autoindent   " always set autoindenting on
endif " has("autocmd")

" 调整分割窗口大小快捷键
" nmap w= :resize +3<CR>
" nmap w- :resize -3<CR>
" nmap w, :vertical resize +3<CR>
" nmap w. :vertical resize -3<CR>

" 支持鼠标滚屏
set mouse=a
" 定义python ycm触发器(2个字母后自动提示系统自带函数等)
let g:ycm_semantic_triggers =  {
	\ 'python':['->', '.' , 're!\w{1}'],
	\}

" set background=dark    " Setting dark mode
""" Hilight search and set numbers
set hlsearch
highlight Search guibg=#af005f ctermbg=125
" split navigations 分屏幕快捷键
nnoremap <C-h> :split<return>
nnoremap <C-g> :vsplit<return>
"""" clear highlight with <esc> after a search
nnoremap <C-o> :noh<return>
set number

" 注释插件配置
" 注释符号后添加空格
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_python= 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"set cc=80

" Airline configuration
" let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Nerdtree configuration
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:nerdtree_tabs_open_on_cosole_startup = 0
" 启动vim后自动打开NERDTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Switching between buffers
" Set commands to switching between buffers
:nnoremap <Tab> :bnext!<CR>
:nnoremap <S-Tab> :bprevious!<CR>
:nnoremap <C-X> :bp<bar>sp<bar>bn<bar>bd<CR>

" File searchs 文件搜索快捷键
map <C-p> :Files<CR>
" Ale Configuration
"""" Better formatting fo worp/ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%] [%...code...%]'
"""" Enable completion where available.
let g:ale_completion_enabled = 1
""" Customize linters that are turned on
let g:ale_linters = {
	\   'python': ['flake8'],
	\}
let g:ale_set_highlights = 0

" Fix keys
set backspace=2
" 忽略大小写搜索
set ignorecase

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

nmap <F8> :TagbarToggle<CR>
" save and run
nnoremap <buffer> <F5> <Esc>:w<cr>:!python3 %<cr>
let g:SuperTabDefaultCompletionType = "context"
"let g:jedi#popup_on_dot = 0
" let g:jedi#use_splits_not_buffers = "right"

" nnoremap <F2> :Autoformat<CR>
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" 光标所在行列高亮
set cursorline
set cursorcolumn
" 插入模式和普通模式光标样式修改for urxvt
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
