" sh install_awesome_vimrc.sh
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" bundle install
call pathogen#infect('~/.vim/bundle/{}')

" my config
set number
syntax enable
" vim 主题
colorscheme monokai
" common setting
set shiftwidth=2
set tabstop=2

" gbk 编码格式
set fileencodings=ucs-bom,utf-8,euc-cn,cp936,default,latin1
set enc=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set runtimepath^=~/.vim/bundle/ag

" nerdtree
let NERDTreeWinPos="left"
let NERDTreeWinSize=30
let NERDTreeShowHidden=1

" nerdtree tabs config
" let g:nerdtree_tabs_open_on_console_startup=1

" Vim indentLine
let g:indentLine_color_term=239
let g:indentLine_leadingSpaceEnabled = 1

" VimCSS3Syntax
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType less setlocal iskeyword+=-
augroup END

" undo file when every time
try
  set undodir=~/dotfiles/.undo_dir
  set undofile
catch
endtry

" NERDTreeTabsToggle
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" node.vim
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
" javascript lint checker
let g:syntastic_javascript_checkers = ['eslint']
