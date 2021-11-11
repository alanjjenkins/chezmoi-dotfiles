local Ui = {}

function Ui.colorscheme()
    return {
        "folke/tokyonight.nvim",
        config = require("modules.ui.colorscheme_settings")(),
    }
end

function Ui.crates()
        return {
                "Saecki/crates.nvim",
                requires = { 'nvim-lua/plenary.nvim' }
        }
end

function Ui.filemanager()
    return {
        "justinmk/vim-dirvish",
        config = require("modules.ui.filemanager")(),
    }
end

function Ui.git()
    return {
        "tpope/vim-fugitive",
        requires = {
                -- (vimscript) Plugin improve the git commit interface showing diffs to remind you want you are changing. 
                'rhysd/committia.vim',
                -- (vimscript) Adds Fugitive Gbrowse support for Gitlab repos.,
                'shumphrey/fugitive-gitlab.vim',
                -- (vimscript) Adds Fugitive Gbrowse support for Bitbucket repos.
                'tommcdo/vim-fubitive',
                -- (vimscript) Adds Fugitive Gbrowse support for GitHub repos.
                'tpope/vim-rhubarb',
        }
    }
end

function Ui.git_blame()
        return {
                "f-person/git-blame.nvim"
        }
end

function Ui.goyo()
       return {
               'junegunn/goyo.vim',
               config = function()
                       vim.cmd([[
                       autocmd! User GoyoEnter lua require('gitsigns').toggle_signs()
                       autocmd! User GoyoLeave lua require('gitsigns').toggle_signs()

                       autocmd User GoyoEnter set laststatus=0 
                       autocmd User GoyoLeave set laststatus=2
                       ]])
               end
       }
end

function Ui.harpoon()
    return {
        "ThePrimeagen/harpoon"
    }
end

function Ui.jqx()
        return {
                'gennaro-tedesco/nvim-jqx'
        }
end

function Ui.lua_guide()
       return {
               'nanotee/nvim-lua-guide'
       }
end

function Ui.lsp_colors()
        return {
                'folke/lsp-colors.nvim'
        }
end

function Ui.searchindex()
       return {
               'google/vim-searchindex'
       }
end

function Ui.statusline()
    return {
        "glepnir/galaxyline.nvim",
        wants = "nvim-web-devicons",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = require("modules.ui.statusline")(),
    }
end

function Ui.telescope()
    local telescope_requires = {
            "ahmedkhalf/project.nvim",
            "jvgrootveld/telescope-zoxide",
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            "nvim-telescope/telescope-dap.nvim",
            "nvim-telescope/telescope-github.nvim",
            "ThePrimeagen/git-worktree.nvim",
            {
                "kyazdani42/nvim-web-devicons",
                opt = true,
            },
    }

    return {
        "nvim-telescope/telescope.nvim",
        wants = "nvim-web-devicons",
        requires = telescope_requires,
        config = require("modules.ui.telescope")(),
    }
end

function Ui.treesitter()
    return {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        wants = {
            "nvim-ts-rainbow",
            "nvim-ts-autotag",
        },
        requires = {
            { "p00f/nvim-ts-rainbow", opt = true },
            { "windwp/nvim-ts-autotag", opt = true },
        },
        config = require("modules.ui.treesitter")(),
    }
end

return Ui