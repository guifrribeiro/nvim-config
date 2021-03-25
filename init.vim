"this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
 

call plug#begin()
"Plugin section'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} "this is for auto complete, prettier and tslinting
  
  let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier'] "list of CoC extensions needed

  Plug 'jiangmiao/auto-pairs' "this will auto close [ ( {

  "these two plugins will add highlighting and indenting to JSX and TSX files
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

"Config section
syntax enable

set encoding=UTF-8
set tabstop=2
set shiftwidth=2
set expandtab
set number
set background=dark
"nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''

"nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
	\ "Modified"	: "✹",
	\ "Staged"	: "+",
	\ "Untracked" 	: "✭",
    	\ "Renamed"   	: "➜",
    	\ "Unmerged"  	: "═",
    	\ "Deleted"   	: "✖",
    	\ "Dirty"     	: "✗",
    	\ "Clean"     	: "✔︎",
    	\ 'Ignored'   	: '☒',
    	\ "Unknown"   	: "?"
    	\ }
"fzf
nnoremap <c-p> :Files<cr>

"ale
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:coc_global_extensions = [
    \  'coc-snippets',
    \  'coc-emmet',
    \  'coc-html',
    \  'coc-css',
    \  'coc-json', 
    \  'coc-phpls',
    \  'coc-yaml',
    \  'coc-prettier',
    \  'coc-eslint',
    \  'coc-jedi',
    \  'coc-python',
    \   ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
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
