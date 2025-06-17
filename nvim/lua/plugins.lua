vim.deprecate = function() end

local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Common utilities:
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'


-- LSP and Completion and Syntax Highlighting
    Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
    Plug 'neovim/nvim-lspconfig'                                        -- Lsp
      Plug 'nvimdev/lspsaga.nvim'                                         -- LSP customization
      Plug 'antosha417/nvim-lsp-file-operations'                          -- LSP customization
    Plug 'L3MON4D3/LuaSnip'                                             -- Snip
    Plug 'hrsh7th/cmp-nvim-lsp'                                         -- Completion w/ LSP
      Plug 'hrsh7th/cmp-buffer'
      Plug 'hrsh7th/cmp-path'
      Plug 'hrsh7th/cmp-cmdline'
      Plug 'hrsh7th/nvim-cmp'
      Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'williamboman/mason.nvim'
      Plug 'williamboman/mason-lspconfig.nvim'
      Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'


-- QoL upgrades
    Plug 'ibhagwan/fzf-lua'
    Plug ('nvim-neo-tree/neo-tree.nvim', { ['branch'] = 'v3.x' })      -- File Browser (w/ dependencies)
      Plug 'MunifTanjim/nui.nvim'
      Plug '3rd/image.nvim'
    Plug 'akinsho/toggleterm.nvim'                                     -- Cool Terminal
    Plug 'dhruvasagar/vim-table-mode'                                  -- For Creating Tables
    Plug 'folke/todo-comments.nvim'
    -- Git
        Plug 'lewis6991/gitsigns.nvim'
        Plug 'NeogitOrg/neogit'
    Plug 'folke/which-key.nvim'

-- Programming
    Plug 'windwp/nvim-autopairs'                                        -- ()[]{} Completion
    Plug 'stevearc/aerial.nvim'
    Plug 'CRAG666/code_runner.nvim'                                     -- Code Running
        -- Langs
            Plug 'CRAG666/code_runner.nvim'                                     -- Code Running from nvim
            Plug 'ap/vim-css-color'                                             -- CSS Color Preview
            Plug 'MeanderingProgrammer/render-markdown.nvim'                    -- Markdown renderer
            Plug ('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install' })
            -- Plug 'anurag3301/nvim-platformio.lua'
        -- Focus
            Plug 'junegunn/limelight.vim'
            Plug 'folke/zen-mode.nvim' 
            -- Plug 'simrat39/rust-tools.nvim'
            -- Plug 'mrcjkb/rustaceanvim'

-- Appearance
    Plug 'rafi/awesome-vim-colorschemes'                               -- Retro Scheme
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'nvim-lualine/lualine.nvim'                                   -- Status Bar
    Plug 'HiPhish/rainbow-delimiters.nvim'                             -- Colored Delimiters
    Plug 'milisims/foldhue.nvim'                                       -- Fold Colors
    Plug 'rcarriga/nvim-notify'                                        -- Notifications for nvim
    Plug 'benlubas/wrapping-paper.nvim'                                -- Cool plugin for text that goes off the screenpage
    -- Plug 'lcheylus/overlength.nvim'                                    -- Highlight text that goes off the screen

-- Colorschemes
    -- Plug 'RRethy/base16-nvim'
    Plug('sainnhe/edge')
    Plug('navarasu/onedark.nvim')
    Plug('rebelot/kanagawa.nvim')
    Plug 'scottmckendry/cyberdream.nvim' 
    Plug('nyoom-engineering/oxocarbon.nvim')
    Plug('bluz71/vim-moonfly-colors')
    Plug('sainnhe/everforest')
    Plug('EdenEast/nightfox.nvim')
    Plug('whizikxd/naysayer-colors.nvim')
    Plug('yorickpeterse/vim-paper')
    Plug('Verf/deepwhite.nvim')
    Plug 'tiagovla/tokyodark.nvim' 
    Plug 'zenbones-theme/zenbones.nvim' 
    Plug 'bluz71/vim-nightfly-colors' 
    Plug 'rktjmp/lush.nvim'
    Plug 'davidosomething/vim-colors-meh'
    Plug '~/.config/nvim/cyber_real'

-- Unused
    -- Plug ('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })

vim.call('plug#end')

vim.cmd('colorscheme PaperColor')

require('configs.aerial')
require('configs.autopairs')
require('configs.cmp')
require('configs.code_runner')
require('configs.colorizer')
require('configs.fzf')
require('configs.gitsigns')
require('configs.lsp')
require('configs.lspsaga')
require('configs.lualine')
require('configs.mason')
-- require('configs.overlength')
-- require('configs.lightline')
-- require('configs.telescope')
-- require('configs.rustaceanvim')
require('configs.todo-comments')
require('configs.toggleterm')
require('configs.treesitter')
require('configs.neotree')
require('configs.markdownrender')
require('configs.markdown-preview')
require('configs.nvim-notify')
require('configs.wrapping-paper')
require('configs.whichkey')
require('configs.zenmode')
