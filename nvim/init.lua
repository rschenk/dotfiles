require 'rschenk.plugins'
require 'rschenk.plugin_configs'
require 'rschenk.mappings'

-- Initialize color scheme
vim.g.material_style = "deep ocean"
vim.cmd[[colorscheme material]]
-- vim.cmd[[colorscheme tokyonight]]

-- Different option scopes
local o = vim.o   -- global
local bo = vim.bo -- buffer-scoped
local wo = vim.wo -- window-scoped

o.backup = false
o.writebackup = false
bo.swapfile = false   -- http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
o.history = 50
o.ruler = true        -- show the cursor position all the time
o.showcmd = true      -- display incomplete commands
o.incsearch = true    -- do incremental searching
o.hlsearch = true     -- highlight search results
o.laststatus = 2      -- Always display the status line
o.autowrite = true    -- Automatically :write before running commands

-- Softtabs, 2 spaces
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.shiftround = true
o.expandtab = true
bo.autoindent = true
bo.smartindent = true

-- Split panes to right and bottom, which feels more natural
o.splitbelow = true
o.splitright = true

-- Make it obvious where 80 characters is
wo.colorcolumn = '+1'
bo.textwidth = 80

-- Left hand number column
wo.number = true
o.cursorline  = true   -- highlight current line

-- Case sensitivity
o.ignorecase = true    -- ignore case in searches
o.smartcase = true     -- use case in search if any caps typed

-- Hidden whitespace characters
o.list = true -- true = show hidden characters, false = hide
vim.opt.listchars = {tab = '»·', trail = '·', nbsp = '·'}

-- Show substitutions live in the buffer
o.inccommand = 'nosplit'

-- Make netrw work more like nerdtree
vim.g.netrw_liststyle = 3   -- tree-style display
vim.g.netrw_banner = 0      -- remove banner

-- Make drawing faster?
o.lazyredraw = true

-- Very basic tab completion. TODO make this better with LSP and stuff
vim.cmd[[
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
]]

-- Highlight yanked text
vim.cmd[[
  augroup LuaHighLight
    au!
    au TextYankPost * lua vim.highlight.on_yank()
  augroup end
]]
