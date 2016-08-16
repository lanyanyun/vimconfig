call plug#begin('~/vimfiles/plugged')
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'tomtom/tcomment_vim'
call plug#end()

syntax enable  
syntax on

exec 'cd ' . fnameescape('c:\Users\Jacky\Desktop\')

let MRU_File = 'D:\HOME\_vim_mru_files'
"solarized
set background=dark
colorscheme solarized


filetype plugin indent on

set guifont=Consolas:h14
set number
set numberwidth=4  
set wrap " 自动换行  
set autoindent   
set smartindent  
set clipboard=unnamed


set smarttab " 在行和段开始处使用制表符  
set cursorline " 高亮显示当前行  
set expandtab
"set noexpandtab " 不要用空格来代替制表符tab  
set tabstop=4
set shiftwidth=4 
set softtabstop=4

set showmatch " 高亮显示匹配的括号  
set history=1000  
set hlsearch " 高亮被搜索的句子  
set incsearch  
set nowrapscan   " 禁止搜索到文件两端时重新搜索  
 
set gdefault  
" 启动最大化  
if has('gui_running') && has("win32")  
    au GUIEnter * simalt ~x  
endif  

if has("gui_running")
"au GUIEnter * simalt ~x " 窗口启动时自动最大化
set guioptions-=m " 隐藏菜单栏
set guioptions-=T " 隐藏工具栏
set guioptions-=L " 隐藏左侧滚动条
set guioptions-=r " 隐藏右侧滚动条
set guioptions-=b " 隐藏底部滚动条
set showtabline=0 " 隐藏Tab栏
endif
  
behave xterm

"Fullscreen http://www.vim.org/scripts/script.php?script_id=2596
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
"NERDTree Toggle
nnoremap <F10> :exe 'NERDTreeToggle'<CR>

nnoremap <F5> :exe "!%" 'Run Python'<CR>

"////////////////////////////////////////////////////////////////////////////////////////  
"文件显示编码  
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936  
set encoding=utf-8  
set termencoding=utf-8  
set fileencoding=utf-8  
set imcmdline    
  
  
  
" 解决菜单乱码  
"-----------------------------------  
"set langmenu=zh_CN  
"let $LANG = 'zh_CN.UTF-8'  
"source $VIMRUNTIME/delmenu.vim  
"source $VIMRUNTIME/menu.vim  
  
"source $VIMRUNTIME/vimrc_example.vim  
"source $VIMRUNTIME/mswin.vim  
"behave mswin  
"-----------------------------------  
  
"////////////////////////////////////////////////////////////////////////////////////////  
"vim 提示信息乱码解决方法  
"language messages zh_CN.UTF-8  
if has("win32")  
set termencoding=chinese  
language message zh_CN.UTF-8  
endif 

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

