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

" my config
set number
syntax enable
" vim 主题
colorscheme monokai
set shiftwidth=2
set tabstop=2

" gbk 编码格式
set fileencodings=ucs-bom,utf-8,euc-cn,cp936,default,latin1
set enc=utf-8

" bundle install
call pathogen#infect('~/.vim/bundle/{}')

let g:syntastic_javascript_checkers = ['eslint']

" node.vim
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

let NERDTreeWinPos="left"
let NERDTreeWinSize=30
let NERDTreeShowHidden=1

" Vim
let g:indentLine_color_term=239
