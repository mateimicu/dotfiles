"<C-p>----------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------
call plug#begin('~/.nvim/plugged')

" Dependencies

" General plugins
Plug 'scrooloose/nerdtree'                                             " For looking at the tree structure
Plug 'preservim/nerdcommenter'                                         " Helps commenting blocks of text
Plug 'Xuyuanp/nerdtree-git-plugin'                                     " Show git state per file
Plug 'godlygeek/tabular'                                               " Makes an alignment based on a pattern
Plug 'bling/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Run in order to install extentions and language servers
" :CocInstall coc-python coc-go coc-actions, coc-snippets, coc-highlight, coc-json
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'} " Plugin management for Coc
Plug 'godlygeek/tabular'                                               " Makes an alignment based on a pattern
Plug 'majutsushi/tagbar'                                               " Mini Map for code
Plug 'tpope/vim-surround'                                              " Working with surroundings parentheses, brackets, quotes
Plug 'ryanoasis/vim-devicons'                                          " Add emoji icons
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'                                                                                    " Used for searching text in files
Plug 'airblade/vim-gitgutter'                                                                             " Show git changes line by line
Plug 'tpope/vim-fugitive'
Plug 'hotwatermorning/auto-git-diff'                                                                      " Preview commit diffs in git-rebase-todo
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'                                                 " Undo Managment
Plug 'tmhedberg/SimpylFold'                                            " Python syntax aware folding
Plug 'universal-ctags/ctags'
Plug 'liuchengxu/vim-which-key'
Plug 'plasticboy/vim-markdown',  {'for': 'markdown'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'seebi/semweb.vim'                                                                                   " Working with RDF data
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " Preview for markdown

" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go support


" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent      " take indent for new line from previous line
set smartindent     " enable smart indentation
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set autoread        " reload file if the file changes on the disk
set cursorline      " highlight the current line for the cursor
set expandtab       " expands tabs to spaces
set list            " show trailing whitespace
set number          " show number ruler
set relativenumber  " show relative numbers in the ruler
set softtabstop=2
set tabstop=2
set title           " let vim set the terminal title
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!

" folding settings
set foldmethod=indent  " by default fold based on indentation
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Create horizontal splits below the current window
set splitbelow
set splitright




syntax enable
set spell           " spell checking
let mapleader = ',' " Set the leader button

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White

"----------------------------------------------
" Navigation
"----------------------------------------------
" Remapinc CTRL + W + (h, j, k, l) to CTRL +(h, j, k, l)-
" for controlling the windows
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
" Remaping comenzile pentru resizing Windows
map <S-k> <C-W>+
map <S-j> <C-W>-
map <S-h> <C-W><
map <S-l> <C-W>>

" Remmap annoing commands
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Disableing arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


"----------------------------------------------
" Colors
"----------------------------------------------
set background=dark
colorscheme PaperColor
let g:airline_theme='bubblegum'

"----------------------------------------------
" Functions
"----------------------------------------------


"----------------------------------------------
" Plugin: neoclide/coc.nvim
"----------------------------------------------
" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1

" Enable powerline fonts.
let g:airline_powerline_fonts = 1

" Explicitly define some symbols that did not work well for me in Linux.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.maxlinenr = ''

"----------------------------------------------
" Plugin: neoclide/coc.nvim
"----------------------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0



" coc-actions
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" coc-go
" Add missing imports on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')


"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
" Mapping the neardTred toggle to F
map <F2> :NERDTreeToggle<CR>
" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

" Close vim if NERDTree is the only opened window.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files by default.
let NERDTreeShowHidden = 1

" Allow NERDTree to change session root.
let g:NERDTreeChDirMode = 2

"----------------------------------------------
" Plugin: scrooloose/nerdcommenter
"----------------------------------------------
" " Remaping <C-_> <C-_> (from tcomment) to <S-c>  , <S> = Shift
map <S-c> <leader>c<space>

"----------------------------------------------
" Plugin: 'majutsushi/tagbar'
"----------------------------------------------
" Add shortcut for toggling the tag bar
nnoremap <F9> :TagbarToggle<cr>

" Language: Go
" Tagbar configuration for Golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }



"----------------------------------------------
" Plugin: 'junegunn/fzf'
"----------------------------------------------
nnoremap <leader>o :FZF<CR>


"----------------------------------------------
" Plugin: 'mileszs/ack.vim'
"----------------------------------------------
" Use ag instead of ack for search
" This also work with :Ag <patter> from fzf
let g:ackprg = 'ag --nogroup --nocolor --column'

nnoremap <leader>a :Ag<CR>


"----------------------------------------------
" Plugin: fatih/vim-go
"----------------------------------------------
" Highlight more info
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" highlight same variable in view
let g:go_auto_sameids = 1
" show type info in statusbar
let g:go_auto_type_info = 1


" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1

let g:go_metalinter_command = "golangci-lint run"

"----------------------------------------------
" Plugin: mbbill/undotree
"----------------------------------------------
nnoremap <F5> :UndotreeToggle<cr>

"----------------------------------------------
" Plugin: tmhedberg/SimpylFold
"----------------------------------------------
let g:SimpylFold_docstring_preview = 1

"----------------------------------------------
" Language: python
"----------------------------------------------
autocmd BufNewFile,BufRead *.py setlocal colorcolumn=81 " highlight the 80th column as an indicator
au FileType py set foldmethod=syntax


"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=2
au FileType go set softtabstop=2
au FileType go set tabstop=2
au FileType go set foldmethod=syntax

" Mappings
au FileType go nmap <F7> :GoMetaLinter<cr>
au FileType go nmap <F10> :GoCoverageToggle -short<cr>
au FileType go nmap <F11> :GoTest -short<cr>
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoDeclsDir<cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

au FileType go nmap <leader>gx <Plug>(go-doc)

"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set noexpandtab

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: yaml
"----------------------------------------------
au FileType yaml setlocal spell
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2



" fixme
autocmd FileType sparql setlocal commentstring=#\ %s

