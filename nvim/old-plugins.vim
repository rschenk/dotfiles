" Initialize minpac package manager
packadd minpac
call minpac#init()

" Create some commands to more easily use minpac
command! PackUpdate call minpac#update() 
command! PackClean call minpac#clean()

" Initialize the fzf plugin (not done with packages)
set rtp+=/usr/local/opt/fzf

call minpac#add('benmills/vimux') " allows tests to execute in another tmux pane
call minpac#add('christoomey/vim-tmux-navigator') " Navigate between vim and tmux
call minpac#add('janko/vim-test') " run tests in vim
call minpac#add('k-takata/minpac', {'type': 'opt'}) " make minpac update itself
call minpac#add('tpope/vim-bundler') " run bundler through vim
call minpac#add('tpope/vim-endwise') " adds 'end' intelligently in ruby
call minpac#add('tpope/vim-eunuch') " integration with unix commands
call minpac#add('tpope/vim-fugitive') " git integration
call minpac#add('tpope/vim-projectionist') " semantically browse projects
call minpac#add('tpope/vim-rails') " rails integration
call minpac#add('tpope/vim-rake') " rake integration
call minpac#add('tpope/vim-repeat') " makes . command work with fancy cmds
call minpac#add('tpope/vim-sensible') " run bundler through vim
call minpac#add('tpope/vim-surround') " surround stuff with other stuff
call minpac#add('tpope/vim-unimpaired') " pairs of commands that do stuff
call minpac#add('vim-ruby/vim-ruby') " ruby integration
call minpac#add('vim-scripts/tComment') " quickly comment lines
call minpac#add('dense-analysis/ale') " asynchronous linting with sane defaults
call minpac#add('jremmen/vim-ripgrep') " RipGrep in quickfix list

call minpac#add('machakann/vim-highlightedyank') " Highlight yanked text
call minpac#add('chriskempson/vim-tomorrow-theme') " Tomorrow color theme
call minpac#add('mtth/scratch.vim') " easy  scratch buffer
call minpac#add('pangloss/vim-javascript') " Javascript syntax
call minpac#add('mxw/vim-jsx') " React jsx highlighting
call minpac#add('neovimhaskell/haskell-vim') " Haskell syntax
call minpac#add('rizzatti/dash.vim') " Dash documentation
call minpac#add('kchmck/vim-coffee-script') " CoffeeScript syntax
call minpac#add('elixir-editors/vim-elixir') " Elixir syntax

" New fuzzy finder situation called telescope
call minpac#add('nvim-lua/plenary.nvim') " Dunno what this does but required by telescope
call minpac#add('nvim-telescope/telescope.nvim') " Fancy fuzzy finder for nvim 0.5
call minpac#add('nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }) " Fuzzy sorter that telescope needs


" Language server support
" call minpac#add('autozimu/LanguageClient-neovim', {'rev': 'next', 'do': '!bash install.sh'})
