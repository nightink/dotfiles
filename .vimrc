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
" set background=dark
colorscheme monokai
" Remove this line if using the default palette.
" let g:hybrid_reduced_contrast = 1
" let g:hybrid_custom_term_colors = 1

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
" let NERDTreeShowHidden=1

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

" node.vim
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" javascript lint checker @hotoo
function! SyntasticJavaScriptChecker()
  let l:eslint = 'eslint'

  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]

    if strlen(l:npm_bin)
      let l:lint_path = l:npm_bin . '/' . 'eslint'
      if executable(l:lint_path)
        let l:eslint = l:lint_path
      endif
    endif
  endif

  let b:syntastic_javascript_eslint_exec = l:eslint
endfunction

let g:syntastic_javascript_checkers = ['eslint']
autocmd FileType javascript call SyntasticJavaScriptChecker()
autocmd FileType typescript setlocal completeopt-=menu
let g:tsuquyomi_completion_detail = 1

" let g:lightline = {
" \ 'colorscheme': 'wombat',
" \}

set updatetime=250
" let g:gitgutter_highlight_lines = 1
let g:gitgutter_enabled = 1

" airline theme
let g:airline_theme='hybridline'
