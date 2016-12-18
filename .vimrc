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

" Remove this line if using the default palette.
" let g:hybrid_reduced_contrast = 1
" let g:hybrid_custom_term_colors = 1

" vim 主题
set background=dark
colorscheme monokai
" colorscheme hybrid
" colorscheme peaksea

" common setting
set shiftwidth=2
set tabstop=2

" gbk 编码格式
set fileencodings=ucs-bom,utf-8,euc-cn,cp936,default,latin1
set enc=utf-8

" Enable folding
set runtimepath^=~/.vim/bundle/ag
set foldmethod=indent
set foldlevel=99
set updatetime=250
" Enable folding with the spacebar
nnoremap <space> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdtree config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos="left"
let NERDTreeWinSize=32
let NERDTreeShowHidden=1
" nerdtree tabs config
" let g:nerdtree_tabs_open_on_console_startup=1

" Vim indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_enabled = 1
let g:indentLine_color_term=239
let g:indentLine_leadingSpaceEnabled = 1

" VimCSS3Syntax
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType less setlocal iskeyword+=-
augroup END

" node.vim
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javascript config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" let g:syntastic_javascript_checkers = ['eslint']
" autocmd FileType javascript call SyntasticJavaScriptChecker()
" autocmd FileType typescript setlocal completeopt-=menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 全局视图模式替换
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap qq y:%s`<C-R>"``gc<left><left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

let &runtimepath.=',~/.vim/bundle/ale'
filetype plugin on
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \}

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:gitgutter_highlight_lines = 1
let g:gitgutter_enabled = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['fugitive', 'readonly', 'gitgutter', 'filename', 'modified', 'syntastic']
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     ['percent'],
      \     ['fileformat', 'fileencoding', 'filetype'],
      \   ]
      \ },
      \ 'component_function': {
      \   'syntastic': 'ALEGetStatusLine',
      \   'gitgutter': 'MyGitGutter',
      \ },
      \ }

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction
