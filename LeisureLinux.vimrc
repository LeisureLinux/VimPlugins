" ****************************************************************
" * LeisureLinux [In both BiliBili ID & WeChat ID] Vim Notes     *
" *                -- Copyright or Copyleft, that is a question. *
" *                -- 2021.11.02, Shanghai, China                *
" ****************************************************************
"
" 为更好的让初学者用好 Vim 插件 ，特别加注释，一个文档全搞定
" If nvim, put below three lines into ~/.config/nvim/init.vim
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc
" ################################################################
" Tip 0: 如何使用本文件？(How to use this file?)
"  * Step 1: 备份 ~/.vimrc 文件(Backup ~/.vimrc file first)
"  * Step 2: 下载本文件：(Download this file)
"  *      $ curl -fLo ~/.vimrc \
"           [ -x socks5://yourProxyServer:port/ \ ] 
"       https://raw.githubusercontent.com/LeisureLinux/VimPlugins/master/LeisureLinux.vimrc 
"  * Step 3: 安装 vim-plug 插件管理器(Install vim-plug, the manager)
"         $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"         ## 请注意 vim-prettier 的安装需要去 packpath 下                   
"  * Step 4: 安装所有插件(Run :PlugInstall to install all Plugins)
"         ## 选项一：$ vim +PlugInstall +qall --headless
"         ## 选项二：如果有网络问题，可以直接下载已经打包好的文件(不保证最新)： 
"         https://github.com/LeisureLinux/VimPlugins/releases/download/v0.2.1/LeisureLinux_Plugins.tar.xz，然后直接解压： $ tar xf <filename>  -C ~/.vim
"
" Tip 1: Ctr-D & Ctr-]
"  * :h <搜索字符>Ctr-D 是万能药，例如： :h html<Ctr-D>
"  * 帮助内的高亮字符，都可以按 Ctr+] 进入
"  * 如果不理解里面的任何词汇，只需要 :h <keywords> 即可
"
" Tip 2: 选择不同的颜色主题(colorscheme)
"  * :h colo 加空格，再按 Ctr-D 就可以选择不同的颜色主题了
"  * :h colo 直接回车则显示当前默认 colorscheme
"
" Tip 3: 插件相关的命令
"  * 操作系统启动时可以用 -c 或者 + 后加 vim 命令
"  * $ vim +PlugInstall +qall --headless  // 常用的安装插件的办法
"  * 其他插件命令： :PlugStatus :PlugUpdate :PlugClean :PlugUpgrade
" 
" Tip 4: 不要被 Tab 搞混了
"  * Ctr-W + T 可以把窗口切换成全屏
"  * :tabs 可以列出所有的 Tab
"  * gt 在所有的 Tab 之间跳转，Ctr-W + w 则在窗口之间跳转
"  * :tabe <filename> 可以在新的 Tab 编辑文件
"  * CtrlP 插件里，直接回车默认是在当前窗口打开
"  * 选中文件 Ctr-O 会提示打开的位置
"  * NERDTree 插件， Ctr-N 选中文件，按 t 才是在 Tab 打开
" 
" Tip 5: 调试（PDAC：Plan-Do-Act-Check 方法论）
"  * 查看加载的脚本：      :scripts
"  * 查看最近的消息：      :messages 
"  * 查看所有映射的键：    :map
"  * 检查配置健康状态：    :checkhealth 
"  * 关于 debug 的帮助      :h debug ；启动 Debug $ vim -D 
"  * 如果遇到有些插件冲突需要调试，关闭所有插件可以用
"      $ vim -u NONE
" 
" Tip 6: 其他
"   默认的 <Leader> 是 "\"，例如格式化代码是 \p
"  * let mapleader = ","
"  * set timeoutlen = 1000
" **********************************************************
"
" 设置帮助文档语言为中文： cn
" Change 'cn' to 'en', if you want to read help in English.
" Run ':source %' will take affect immediately
set helplang=cn
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'
set guifont=DroidSansMono\ Nerd\ Font:h16
" Full screen support
set guioptions-=T  "remove toolbar
set guioptions-=m  "remove menu bar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'

" 加载 vim-prettier from ~/.vim/pack/plugins/start
packloadall

" **********************************************************
" * 如果你要使用 Vundle 来安装，请使用本段内注释掉的语句
" * 然后在操作系统内运行 $ vim +"PluginInstall" +qa --headless
" * set the runtime path to include Vundle and initialize
" * set rtp+=~/.vim/bundle/Vundle.vim
" * alternatively, pass a path where Vundle should install plugins
" * call vundle#begin('~/some/path/here')
" *  Plugin 'VundleVim/Vundle.vim'
" * call vundle#end()            " required
" * filetype plugin indent on    " required
" **********************************************************
call plug#begin('~/.vim/plugged')
  "
  "颜色主题，帮助:h gruvbox8
  " Plug 'lifepillar/vim-gruvbox8'
  "颜色主题 meta5
  Plug 'christophermca/meta5'
  " 中文帮助
  Plug 'yianwillis/vimcdoc'
  "
  "SQL Format
  Plug 'b4b4r07/vim-sqlfmt'
  "需要 ctags 支持的代码标签支持，先生成 tags 文件，帮助:h taglist
  Plug 'vim-scripts/taglist.vim' 
  "Git 仓库管理，帮助:h fugitive
  Plug 'tpope/vim-fugitive' 
  "支持 git diff ，帮助:h gitgutter
  Plug 'airblade/vim-gitgutter'
  " Cmake 项目支持，帮助:h cmake 
  Plug 'cdelledonne/vim-cmake' "cmake 
  " sparkup 暂时无帮助
  Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
  "
  " vim-toml 暂时无帮助
  " Plug 'cespare/vim-toml'
  " editorconfig seemed not that help
  " Plug 'editorconfig/editorconfig-vim'
  " lightline seemed not that help as well
  " Plug 'itchyny/lightline.vim'
  " Plug 'mengelbrecht/lightline-bufferline'
  " For commentary，是不是会有冲突？
  " Plug 'tpope/vim-commentary'
  "
  "Golang Support
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " Clang Coding Style 帮助:h clang-format
  Plug 'rhysd/vim-clang-format'
  "CSV File Support
  Plug 'chrisbra/csv.vim'
  " 模糊搜索支持， 帮助:h fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " 对齐, 帮助:h easy-align
  Plug 'junegunn/vim-easy-align'
  " 必备：按下 Ctr-P 模糊搜索文件，帮助:h ctrlp 
  Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
  " To be researched
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Languange Server Protocol
  Plug 'prabirshrestha/vim-lsp'
  " 制表符对齐 帮助:h tabular
  Plug 'godlygeek/tabular'
  " Markdown ，默认折叠， 帮助:h markdown
  Plug 'plasticboy/vim-markdown'
  " 语法分析器 Syntax and lint checking :h ale
  Plug 'dense-analysis/ale'  
  " HTML/CSS 代码快写工具 帮助:h emmet
  Plug 'mattn/emmet-vim'
  "必备，树形目录<Ctr-N>，需要字体支持 帮助:h nerdtree
  "不要忘记了，终端的字体也要用 Nerd Fonts
  Plug 'scrooloose/nerdtree'
  " 用 \cc 添加注释，帮助:h nerd 
  Plug 'scrooloose/nerdcommenter'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Plug 'christoomey/vim-tmux-navigator'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  " 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
  " 语言支持， 帮助 :h polyglot
  Plug 'sheerun/vim-polyglot'
  "必备：各大区块显示 帮助:h vim-airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "显示开发图标，帮助:h devicons
  "安装 Nerd Font 兼容的字体或者自己打补丁
  "设置终端字体也必须为 Nerd 兼容 (或者设置 'guifont' 如果使用的是GUI 版本).
  "一定要设置 set encoding=utf8
  Plug 'ryanoasis/vim-devicons'
  " Plug 'Yggdroot/indentLine' 
  " Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
call plug#end()

" rtp is abbeviation of run time path
set rtp+=~/.fzf
"
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" taglist flag
let Tlist_Inc_Winwidth = 0
let g:sqlfmt_command = "sqlfmt"

"au User lsp_setup call lsp#register_server({
    "\ 'name': 'php',
    "\ 'cmd': {server_info->['php', expand('$HOME/vendor/bin/php-language-server.php')]},
    "\ 'whitelist': ['php'],
    "\ })
"autocmd FileType php setlocal omnifunc=lsp#complete

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

set nocompatible              
filetype on
set mouse=a
set number
set hidden
set cindent
set autoindent
set tabstop=4
set expandtab
set smartindent
set shiftwidth=4
set encoding=utf8
set history=5000
set clipboard=unnamedplus
"set cursorline

" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",  
    \ "Modified"  : "#d9bf91",  
    \ "Renamed"   : "#51C9FC",  
    \ "Untracked" : "#FCE77C",  
    \ "Unmerged"  : "#FC51E6",  
    \ "Dirty"     : "#FFBD61",  
    \ "Clean"     : "#87939A",   
    \ "Ignored"   : "#808080"   
    \ }                         
let g:NERDTreeIgnore = ['^node_modules$']

" vim-prettier
" let g:prettier#quickfix_enabled = 0
" let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_open_new_file = 't'

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <C-s> :w<CR>
nnoremap <C-Q> :wq<CR>

" shift+arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
" map <C-v> pi
" imap <C-v> <Esc>pi

colorscheme spring

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-python',
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_nfo()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>i

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='base16_twilight'
let g:airline#extensions#tabline#formatter = 'default'

nnoremap <M-Right> :bn<cr>
nnoremap <M-Left> :bp<cr>
nnoremap <c-x> :bp \|bd #<cr>

let g:ale_completion_enabled = 0
let g:ale_linters = {'python': ['flake8', 'pylint'], 'javascript': ['eslint']}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

" Clang
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c,cpp ClangFormatAutoEnable
"
let g:sql_type_default = 'mysql'
