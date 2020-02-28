" Install
" wget https://github.com/vim/vim/archive/v8.2.0326.tar.gz
" tar zxvf v8.2.0326.tar.gz
" cd v8.2.0326
" # 注意python config位置
" ./configure --with-features=huge --enable-pythoninterp=yes  --enable-cscope --enable-fontset --enable-perlinterp --enable-rubyinterp --with-python-config-dir=/usr/lib/python2.7/config --prefix=/usr/local
" make && make install
" alias vi='/usr/local/bin/vim '
" /usr/local/bin/vim --version| head -n 1

" https://superuser.com/questions/302186/vim-scrolls-very-slowly-when-a-line-is-too-long
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1000
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems

set ignorecase

" for paste mode toggle
set pastetoggle=<F2>
map <F4> :%retab! <CR> :w <CR>
" http://vim.wikia.com/wiki/Fix_indentation, 自动格式化代码
"map <F5> mzgg=G`z`

"for mac os crontab
autocmd filetype crontab setlocal nobackup nowritebackup
map <M-s> :w<kEnter>  "Works in normal mode, must press Esc first"
imap <M-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode"
autocmd BufWritePre * :%s/\s\+$//ge

"set list listchars=eol:¬,tab:▸\ ,trail:.,
" keep 3 lines when scrolling"
set scrolloff=3
set shiftround

set undofile
set undodir=~/.Vim_undodir
set undolevels=1000

set guifont=Monaco:h16
set guifont=Monaco\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
set cursorline
" set backupdir=~/.Vimbackup
" setlocal textwidth=80
set tags=tags
set noautochdir    " 注意这个自动切换目录会使rope找目录不正确，禁用，坑死我
autocmd BufRead,BufNewFile *.py set et ts=4 sw=4 sts=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set nu
if has('gui_running')
    set background=dark
else
    set background=dark
endif

" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk
endif

source $VIMRUNTIME/vimrc_example.vim
set langmenu=en_US
let $LANG= 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set splitright
"turn off vim compatible check
set nocompatible
"check file type
set completeopt=longest,menu
"histroy line count
set history=1000
set showmatch
"left-down status line
set ruler
"auto match targets
set incsearch
"high light search
set hlsearch
"auto backup file with filename+~
"set backup
set title
set foldenable
"fold code by syntax 'cmd':
"'zi' open/close all folds
"'za' open/close current fold
"'zM' close all folds
"'zR' open all folds
set foldmethod=indent
"set foldmethod=marker
"set foldmethod=indent
set foldcolumn=0
set foldopen=all
"set foldclose=all
"colorscheme evening
"set cinoptions+={2,0,p0,t0
set formatoptions=tcqr
set nu

nnoremap py :!python %<cr>
nnoremap pt :!py.test %<cr>
nnoremap no :!node %<cr>
"nnoremap gd :!sudo gdb %:r<cr>
"nnoremap ma :!make<cr>


" =======================================

call plug#begin('~/.vim/plugged')

" 美化主题
Plug 'Yggdroot/indentLine'                           " 美化代码缩进
Plug 'morhetz/gruvbox'                               " colorscheme: gruvbox
Plug 'junegunn/seoul256.vim'                         " colorscheme: seoul256
Plug 'w0ng/vim-hybrid'                               " colorscheme: hybrid
Plug 'joshdick/onedark.vim'                          " colorschema: onedark
Plug 'srcery-colors/srcery-vim'                      " colorschema: srcery
Plug 'rakr/vim-one'                                  " colorscheme: one
" Plug 'altercation/vim-colors-solarized'            " 需要手动安装
Plug 'jaxbot/semantic-highlight.vim'                 " ,h 根据语义来代码高亮
Plug 'bling/vim-airline'                             " 状态栏
Plug 'vim-airline/vim-airline-themes'                " 同上


" 功能扩展
" Plug 'Chiel92/vim-autoformat' " https://github.com/Chiel92/vim-autoformat for code formatter
Plug 'terryma/vim-expand-region'                     " + 扩大选择, - 减少选择
Plug 'ntpeters/vim-better-whitespace'                " 空白
Plug 'fullybaked/toggle-numbers.vim'                 " 行号
Plug 'airblade/vim-gitgutter'                        " git状态
Plug 'lfv89/vim-interestingwords'                    " https://github.com/lfv89/vim-interestingwords
Plug 'elzr/vim-json'                                 " json格式化
Plug 'ervandew/supertab'                             " 补全
Plug 'tpope/vim-surround'                            " 高效操作配对符号
Plug 'tpope/vim-repeat'                              " 按.重复surround操作
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                              " 搜索
Plug 'mhinz/vim-startify'                            " vim启动菜单
Plug 'majutsushi/tagbar'                             " 列出tag
Plug 'tpope/vim-fugitive'                            " git命令
Plug 'junegunn/gv.vim'                               " git https://github.com/junegunn/gv.vim git commit browser
Plug 'Xuyuanp/nerdtree-git-plugin'                   " 导航目录中看到 git 版本信息


" 代码补全
" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1

Plug 'godlygeek/tabular'                           " 文本对齐, 选定文本 :Tab/符号
Plug 'jiangmiao/auto-pairs'                        " 自动匹配对称标记
Plug 'kien/rainbow_parentheses.vim'                " 彩色括号
Plug 'honza/vim-snippets'                          " 代码模板
" Plug 'SirVer/ultisnips'                            " 代码模板
" Plug 'vim-syntastic/syntastic'                   " 语法检测
Plug 'scrooloose/nerdtree'                         " 目录树
Plug 'jistr/vim-nerdtree-tabs'                     " 目录树
Plug 'ctrlpvim/ctrlp.vim'                          " 类似vscode command + p
Plug 'tpope/vim-dispatch'                          " 异步编译及testing
Plug 'easymotion/vim-easymotion'                   " 快速移动插件, ',,w'可以在单词上出现前缀，然后快速跳转
Plug 'haya14busa/incsearch.vim'                    " 支持regex的匹配查询
Plug 'Valloric/YouCompleteMe'
Plug 'haya14busa/incsearch-fuzzy.vim'              " 同上
Plug 'dgryski/vim-godef'                           " for golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinarie    s' }
" Plug 'jmcantrell/vim-virtualenv'                 " for python
Plug 'python-mode/python-mode'                     " for python
Plug 'zchee/deoplete-jedi'                         " for python
Plug 'ryanoasis/vim-devicons'                      " 文件icon
Plug 'scrooloose/nerdcommenter'                    " 快速注释
" Plug 'xolox/vim-misc'                           " load vimscript


" 模糊搜索，使用z/支持模糊搜索
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)


call plug#end()

" ===========================================


" brew install vim --with-python3
nmap <silent> <C-d> <Plug>(pydocstring)
nnoremap py :!python %<cr>
" 用ctrl+l可以在insert和command模式都可以保存
inoremap <c-l> <c-o>:w<cr>
nnoremap <c-l> :w<cr>
" 切换 buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

let g:pymode_python = 'python'  " Values are `python`, `python3`, `disable`.
let g:pymode_paths = reverse(split(globpath(getcwd().'/eggs', '*'), '\n'))    " support zc.buildout
let g:pymode_trim_whitespaces = 1
let g:pymode_quickfix_maxheight = 3
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = "<C-k>"
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # BREAKPOINT TODO REMOVE; from nose.tools import set_trace; set_trace()'


let g:pymode_run = 1
let g:pymode_run_bind = "<C-e>"
"let g:pymode_run_bind = '<leader>r'
let g:pymode_virtualenv = 1

" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc=1
let g:pymode_doc_bind = 'K'

autocmd CompleteDone * pclose
" python-mode conflict with jedi
let g:pymode_rope = 0
let g:pymode_rope_autoimport = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_goto_definition_bind = "<C-j>"
let g:pymode_rope_goto_definition_cmd = 'vnew'
let g:pymode_rope_regenerate_on_write = 0
command PR PymodeRopeRegenerate

let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
" http://stackoverflow.com/questions/16021297/how-to-map-alias-a-command-in-vim, PymodeLint映射成PL
command PL PymodeLint
command F PymodeLintAuto    " auto pep8 fix
let g:pymode_lint_ignore = "C0111, W0105, C0325"
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = '😡'
let g:pymode_lint_error_symbol = '❌'
let g:pymode_lint_comment_symbol = '😢'


" 修改默认的红线为浅色，solorized黑色主题
highlight ColorColumn ctermbg=233
let g:pymode_lint_cwindow = 0
let g:pymode_options_max_line_length = 120
let g:pymode_options_colorcolumn = 1
" 指定UltiSnips python的docstring风格, sphinx, google, numpy
let g:ultisnips_python_style = 'sphinx'


" For emmemt only avilable for html,css,sass
let g:user_emmet_install_global = 0
autocmd FileType html,htmldjango,css,scss.css,sass,jsx,javascript,javascript.jsx  EmmetInstall
let g:user_emmet_expandabbr_key = '<C-j>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}


autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()"
"新建.py,.cc,.java,.sh,
"定义函数SetTitle，自动插入文件头
func SetTitle()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*- coding:utf-8 -*-")
        normal G
        normal o
        normal o
        call setline(5, "if __name__ == '__main__':")
        call setline(6, "    pass")
    endif
endfunc


function HeaderSh()
    call setline(1, "#!/usr/bin/env bash")
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.sh call HeaderSh()


" shortcuts to vimdiff, http://stackoverflow.com/questions/7309707/why-does-git-mergetool-opens-4-windows-in-vimdiff-id-expect-3
let mapleader=','
let g:mapleader=','

if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif


" for nerdtree
nmap ,v :NERDTreeFind<cr>
nmap ,g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [
            \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.svn$', '\.swp$',
            \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
            \ ]

" for Tagbarbar, sudo apt-get install ctags
"nmap <F8> :TagbarToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0    " sort by sourcefile
"let g:tagbar_show_linenumbers = 1
set updatetime=1000    " ms update


" for airline
let g:airline_powerline_fonts=1
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
function! ArilineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%F'])
    "let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call ArilineInit()

" change tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" https://stackoverflow.com/questions/15583346/how-can-i-temporarily-make-the-window-im-working-on-to-be-fullscreen-in-vim
nnoremap tt :tab split<CR>

" 高亮当前选中单词
autocmd CursorMoved * exe exists("HlUnderCursor")?HlUnderCursor?printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none':""
nnoremap <silent> <F3> :exe "let HlUnderCursor=exists(\"HlUnderCursor\")?HlUnderCursor*-1+1:1"<CR>


" rst书写插件
let proj1 = { 'path': '~/Program/python-web-guide',}
let g:riv_projects = [proj1]

" ctrlp, 在~/.agignore添加一行node_modules
" https://stackoverflow.com/questions/24479101/vim-ctrlp-not-parsing-ag-silver-search-ignore-option-correctly
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|swp|pyc|pyo)$',
  \ }
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif


"http://vimawesome.com/plugin/scss-syntax-vim
au BufRead,BufNewFile *.scss set filetype=scss.css


"http://vimawesome.com/plugin/rainbow-parentheses-vim   花里胡哨的彩虹括号^_^
"http://www.wklken.me/posts/2015/06/07/vim-plugin-rainbowparentheses.html
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"语法检查配置
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" 评论配置
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1


"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

 "比较喜欢用tab来选择补全...
"function! MyTabFunction ()
    "let line = getline('.')
    "let substr = strpart(line, -1, col('.')+1)
    "let substr = matchstr(substr, "[^ \t]*$")
    "if strlen(substr) == 0
        "return "\<tab>"
    "endif
    "return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
"endfunction
"inoremap <tab> <c-r>=MyTabFunction()<cr>


" for golang https://github.com/fatih/vim-go
" https://github.com/fatih/vim-go-tutorial
let g:go_version_warning = 0
set autowrite
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['golint']
let g:go_metalinter_autosave = 1


" for json
let g:vim_json_syntax_conceal = 0
autocmd FileType json,javascript,html,jsx,javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab

" https://github.com/wincent/wincent/blob/bff31c32e427c5913d1eed0b0c1b3da24e8ba8ba/roles/dotfiles/files/.vim/plugin/settings.vim#L38
if has('folding')
  if has('windows')
    set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j                " remove comment leader when joining comment lines
endif

set formatoptions+=n                  " smart auto-indenting inside numbered lists
set guioptions-=T                     " don't show toolbar
set hidden                            " allows you to hide buffers with unsaved changes without being prompted
set highlight+=c:LineNr               " blend vertical separators with line numbers
set laststatus=2                      " always show status line
set lazyredraw                        " don't bother updating screen during macro playback

" exit 退出快捷键
noremap <leader>w :w!<cr>             " 强制写入
noremap <leader>q :q!<cr>             " 强制退出
noremap <leader>wq :wq!<cr>           " 写入退出
noremap <leader>buf :bd<cr>           " 清理缓存
noremap <leader>s :vs<cr>             " vertical split
noremap <leader>r :e!<cr>             " reload without save

" Del 删除
nmap <Del> x
nmap <Bs> x
vmap <Bs> x

" v 模式下复制内容到系统剪切板
vmap <Leader>c "+yy
" nmap <leader>v "+gp

" 跳到上次标记处
noremap <c-i> <Esc>`^


" https://github.com/lfv89/vim-interestingwords 高亮感兴趣的 word
nnoremap <silent> <leader>f :call InterestingWords('n')<cr>
nnoremap <silent> <leader>F :call UncolorAllWords()<cr>

" https://github.com/jaxbot/semantic-highlight.vim
nnoremap <Leader>h :SemanticHighlightToggle<cr>

" 禁止 startify 自动切换目录
let g:startify_change_to_dir = 0

"
set background=dark
" colorscheme gruvbox
" colorscheme hybrid
" colorscheme   seoul256
" colorscheme srcery
" colorscheme one
colorscheme onedark

" solarized 主题
" let g:solarized_termtrans = 1
" set background=dark
" colorscheme solarized
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorschema hybrid, https://github.com/w0ng/vim-hybrid


" 用 ,a 搜索当前 cursor 下单词
if executable('ag')
    noremap <leader>a :Ag! -w "<cword>"<cr>
else
    noremap <Leader>a :Ack <cword><cr>
endif

" Sudo to write
" cnoremap w!! w !sudo tee % >/dev/null

" Plug 'fullybaked/toggle-numbers.vim'
nmap ,n :LineNumberToggle<cr>

" https://github.com/ianva/vim-youdao-translater settings
vnoremap <silent> <C-Y> :<C-u>Ydv<CR>
nnoremap <silent> <C-Y> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

" add :FormatJSON command, https://coderwall.com/p/faceag/format-json-in-vim
com! FormatJSON %!python3 -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=2))"
com! FormatJSONPy3 %!python3 -m json.tool
com! FormatJSONPy2 %!python -m json.tool
com! FormatJSONPy2Utf8 %!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=2)"

" Setting up how to display whitespace characters
set list
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~


" ale config
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_linters = {'python': []}
