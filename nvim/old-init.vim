set encoding=utf-8
set fileencoding=utf-8

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight search results
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

filetype plugin indent on

" Activate fzf with Ctrl-P
nnoremap <C-p> :<C-u>FZF<CR>

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END


" Don't use the sign column/gutter for ALE
let g:ale_set_signs = 0

" Lint always in Normal Mode
let g:ale_lint_on_text_changed = 'normal'

" Lint when leaving Insert Mode but don't lint when in Insert Mode 
let g:ale_lint_on_insert_leave = 1

" Set ALE's 200ms delay to zero
let g:ale_lint_delay = 0

" Simple red underlines for errors
" This didn't seem to do anything so I also put it at the end of this file
" autocmd VimEnter * highlight ALEError ctermbg=none cterm=underline ctermfg=red
" autocmd VimEnter * highlight ALEWarning ctermbg=none cterm=underline ctermfg=yellow

" Tell ALE where to find Elixir-ls
let g:ale_elixir_elixir_ls_release=expand('~/bin/elixir-ls/release')
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}

" eslint for javascript
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'elixir': ['elixir-ls'],
      \}

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint'],
      \ 'elixir': ['mix_format'],
      \}


" Spelling colors, but also ALE uses this for error/warning styles too
augroup spelling
  autocmd ColorScheme * hi clear SpellBad
        \| hi SpellBad ctermbg=none cterm=underline ctermfg=red
  autocmd ColorScheme * hi clear SpellCap
        \| hi SpellCap ctermbg=none cterm=underline ctermfg=yellow
augroup END

" LanguageClient configuration
" let g:LanguageClient_serverCommands = {
" \ 'elixir': ['~/bin/elixir-ls/release/language_server.sh'],
" \ }
"
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='solr' --exclude='solr_instance'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" vim-test mappings
if exists('$TMUX')
  let test#strategy = "vimux"
else
  let test#strategy = "neovim"
endif
nnoremap <silent> <Leader>r :TestFile<CR>
nnoremap <silent> <Leader>R :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Copy and paste to system clipboard
vmap <Leader>y "+y " Works on visual selections
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" ALE Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
nnoremap <Leader>af :ALEFix<cr>
nnoremap <Leader>ad :ALEGoToDefinition<cr>
nnoremap K :ALEHover<cr>

" Show substitutions live in the buffer
set inccommand=nosplit

set ignorecase          " ignore case in searches
set smartcase           " use case in search if any caps typed
set cursorline          " highlight current line
" set lazyredraw          " redraw only when we need to

" clear search highlight by pressing Enter
nnoremap <CR> :noh<CR><CR>

" make netrw work more like nerdtree
let g:netrw_liststyle = 3   " tree-style display
let g:netrw_banner = 0      " remove banner

" Vim's internal grep commands use `rg`
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Color scheme
set background=dark " light
colorscheme tomorrow-night

