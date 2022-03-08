"==
"=== load the your old configuration
"==
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" This allows users who have per-project Ruby versions (e.g. withrvm) to pin
" to a particular gem installation.
" let g:ruby_host_prog = 'rvm system do neovim-ruby-host'

" disable the perl provider
let g:loaded_perl_provider = 0

" configure the clipboard
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': ['tmux', 'load-buffer', '-'],
      \      '*': ['tmux', 'load-buffer', '-'],
      \    },
      \   'paste': {
      \      '+': ['tmux', 'save-buffer', '-'],
      \      '*': ['tmux', 'save-buffer', '-'],
      \   },
      \   'cache_enabled': 1,
      \ }

" configure python
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

" configure the perl
" let g:perl_host_prog = '/usr/bin/perl'


let g:ruby_host_prog = '~/.local/share/gem/ruby/3.0.0/'




" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-docker',
	\ 'coc-eslint',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-import-cost',
	\ 'coc-java',
	\ 'coc-jest',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-omnisharp',
	\ 'coc-prettier',
	\ 'coc-prisma',
	\ 'coc-pyright',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tailwindcss',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-yank',
	\ 'https://github.com/rodrigore/coc-tailwind-intellisense']
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>H :call Show_documentation()<CR>
" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
" coc-translator
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'bohn'

autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
