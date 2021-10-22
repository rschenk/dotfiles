-- ## Treesitter
require('nvim-treesitter.configs').setup {
   -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option will slow down your editor and you may see some duplicate highlights.
    -- Ruby:
    --   Setting this to false will break tpope/vim-endwise, but it's worth it because
    --   regex highlighting for large ruby files is extremely slow.
    -- Instead of true it can also be a list of languages.
    additional_vim_regex_highlighting = false
  }
}

-- ## nvim-autopairs, configure to work like tpope/endwise
local npairs = require('nvim-autopairs')
npairs.setup()

-- clear all rule if you don't want to use autopairs
npairs.clear_rules()

-- make it work like endwise
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))

-- ## Telescope
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    dash = {
      file_type_keywords = {
        ruby = { 'ruby', 'rails' }
      }
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- ## vim-test
vim.g['test#strategy'] = 'neoterm' -- 'neovim'

-- ## neoterm
vim.g.neoterm_default_mod = 'botright' -- open at bottom if horizontal, right if vertical
vim.g.neoterm_autoscroll =  1 -- always scroll to bottom
vim.g.neoterm_size = 10 -- small

-- ## material theme

require('material').setup({
  contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
  borders = true, -- Enable borders between verticaly split windows
  text_contrast = {
    lighter = false, -- Enable higher contrast text for lighter style
    darker = true -- Enable higher contrast text for darker style
  },
  custom_colors = {
    -- I can't read the comments in the "darker" theme but like it otherwise
    comments = '#717CB4'
  }
})
