-- General configuration
require('nv-globals')
require('settings')
require('neovide-settings')
vim.cmd('luafile ~/.config/nvim/nv-settings.lua')
require('plugins')
require('nv-utils')
require('nv-autocommands')
require('keymappings')
require('colorscheme')

vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

-- Plugin configs
require('nv-firenvim')
require('nv-bookmark')
require('nv-colorizer')
require('nv-comment')
require('nv-compe')
require('nv-dial')
require('nv-emmet')
require('nv-floaterm')
require('nv-galaxyline')
require('nv-gitblame')
require('nv-gitsigns')
require('nv-hop')
require('nv-indentline')
require('nv-lightbulb')
require('nv-lspinstall')
require('nv-lspkind')
require('nv-matchup')
require('nv-nvimtree')
require('nv-quickscope')
require('nv-startify')
-- require('nv-surround')
require('nv-telescope')
require('nv-vim-rooter')
require('nv-vimspector')
