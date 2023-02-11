local function zoe_packer_installer()
    local firstrun = false;
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        firstrun = true
    end

    require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'
        -- Themes for using on future
        use 'EdenEast/nightfox.nvim' 
        use 'Abstract-IDE/Abstract-cs'
        use 'Mofiqul/vscode.nvim'
        use 'marko-cerovac/material.nvim'
        use { 'bluz71/vim-moonfly-colors', branch = 'cterm-compat' }
        use 'folke/tokyonight.nvim'
        use 'glepnir/zephyr-nvim'
        use 'ray-x/aurora' 
        use 'ofirgall/ofirkai.nvim'
        use 'fenetikm/falcon'
        use 'navarasu/onedark.nvim'
        use 'sainnhe/everforest'
        use 'rebelot/kanagawa.nvim'
        use 'tiagovla/tokyodark.nvim'
        use 'Yazeed1s/minimal.nvim'
        use 'lewpoly/sherbet.nvim'
        use 'Mofiqul/adwaita.nvim'
        use 'kvrohit/mellow.nvim'
        use 'gbprod/nord.nvim'
        use 'Yazeed1s/oh-lucy.nvim'
        use 'rainglow/vim'
        --- markdown --
        use({ "iamcco/markdown-preview.nvim", 
            run = "cd app && npm install", 
            setup = function() vim.g.mkdp_filetypes = { "markdown" } end, 
            ft = { "markdown" }, })
        -- better git
        use 'tpope/vim-fugitive'
        use 'voldikss/vim-floaterm'
        -- linebar -
        use 'kyazdani42/nvim-web-devicons'
        use 'nvim-lualine/lualine.nvim'
        -- notifications 
        use 'rcarriga/nvim-notify'
        -- our fuxxy    
        use 'nvim-lua/popup.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'nvim-telescope/telescope-file-browser.nvim'
        -- fuzzy debugger integration
        use 'nvim-telescope/telescope-dap.nvim'
        use 'theHamsta/nvim-dap-virtual-text'
        -- leader showkeys    
        use 'folke/which-key.nvim'
        -- lsp
        use {
            'VonHeikemen/lsp-zero.nvim',
            requires = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},             -- Required
                {'williamboman/mason.nvim'},           -- Optional
                {'williamboman/mason-lspconfig.nvim'}, -- Optional
                -- Autocompletion
                {'hrsh7th/nvim-cmp'},         -- Required
                {'hrsh7th/cmp-nvim-lsp'},     -- Required
                {'hrsh7th/cmp-buffer'},       -- Optional
                {'hrsh7th/cmp-path'},         -- Optional
                {'saadparwaiz1/cmp_luasnip'}, -- Optional
                {'hrsh7th/cmp-nvim-lua'},     -- Optional
                -- Snippets
                {'L3MON4D3/LuaSnip'},             -- Required
                {'rafamadriz/friendly-snippets'}, -- Optional
            }
        }
        use 'folke/trouble.nvim'
        -- code colloring
        use { 'nvim-treesitter/nvim-treesitter' }
        use 'nvim-treesitter/playground'
        -- lsp info
        use 'nvim-lua/lsp-status.nvim'
        -- goto gode 
        use 'rmagatti/goto-preview'
        use  'nvim-lua/plenary.nvim'
        -- debugging
        use 'mfussenegger/nvim-dap'
        use 'folke/neodev.nvim'
        use 'rcarriga/nvim-dap-ui'
        -- lint
        use 'mfussenegger/nvim-lint'
        -- cpp formatting
        use 'rhysd/vim-clang-format'
        use 'tenfyzhong/vim-gencode-cpp'
        use 'okanakyuz/a.vim'
        use 'sheerun/vim-polyglot'
        use 'phaazon/hop.nvim'
        ---haskel --
        use 'neovimhaskell/haskell-vim'
        --grammer
        use 'rhysd/vim-grammarous'
       -- CMAKE --
       use 'Civitasv/cmake-tools.nvim'
       --go \
       use 'ray-x/go.nvim'
       use 'ray-x/guihua.lua'
       --use 'crispgm/nvim-go'
       --use 'olexsmir/gopher.nvim'
        -- BarBar 
        --use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
        --nNvimTree 
        --use 'nvim-tree/nvim-tree.lua'
      if firstrun then
        require('packer').sync()
        fn.system({'go', 'install', 'github.com/jesseduffield/lazygit@latest'})
      end
    end)
    return firstrun;
end

local function zoe_settings_init()
    local set = vim.opt
    set.expandtab = true
    set.smarttab = true
    set.shiftwidth = 4
    set.tabstop = 4
    set.hlsearch = true
    set.incsearch = true
    set.ignorecase = true
    set.smartcase = true
    set.splitbelow = true
    set.splitright = true
    set.wrap = false
    set.scrolloff = 5
    set.fileencoding = 'utf-8'
    set.termguicolors = true
    set.relativenumber = true
    set.cursorline = true
    set.hidden = true
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.g.mapleader = ' '
    vim.opt.signcolumn = 'yes'
end

local function zoe_whichkey_init()
    require("which-key").setup({
        plugins = {
            marks = true,
            registers = true, 
            spelling = {
                enabled = false, 
                suggestions = 20, 
            },
            presets = {
                operators = true, 
                motions = true, 
                text_objects = true, 
                windows = true, 
                nav = true, 
                z = true, 
                g = true, 
            },
        },
        operators = { gc = "Comments" },
        key_labels = {
            ["<space>"] = "SPC",
            ["<cr>"] = "RET",
            ["<tab>"] = "TAB",
        },
        icons = {
            breadcrumb = "»", 
            separator = "➜", 
            group = "+", 
        },
        popup_mappings = {
            scroll_down = "<c-d>", 
            scroll_up = "<c-u>", 
        },
        window = {
            border = "none", 
            position = "bottom", 
            margin = { 1, 0, 1, 0 }, 
            padding = { 2, 2, 2, 2 }, 
            winblend = 0,
        },
        layout = {
            height = { min = 4, max = 25 }, 
            width = { min = 20, max = 50 }, 
            spacing = 3, 
            align = "left", 
        },
        ignore_missing = false, 
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, 
        show_help = true, 
        show_keys = true, 
        triggers = "auto", 
        triggers_blacklist = {
            i = { "j", "k" },
            v = { "j", "k" },
        },
        disable = {
            buftypes = {},
            filetypes = { "TelescopePrompt" },
        },
    })

    local wk = require("which-key")
    local telescope = require("telescope.builtin")
    local function search_text_telescope()
        telescope.grep_string({ search = vim.fn.input("Grep > ") })
    end

    wk.register({
        t = {
            name = "Telescope", 
            F = { telescope.find_files, "Find File" }, 
            f = { "<cmd>Telescope file_browser<cr>", "Find Browser" }, 
            l = { telescope.live_grep, "Live Grep" }, 
            b = { telescope.buffers, "Buffers" }, 
            h = { telescope.help_tags, "Help Tags" }, 
            g = { telescope.git_files, "Git files" }, 
            s = { search_text_telescope, "Search" }, 
        },
    }, { prefix = "<leader>" })


    wk.register({
        d = {
            name = "Debug", 
            r = { "<cmd>lua require'dap'.continue()<cr>", "Run" }, 
        q = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" }, 
        w = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" }, 
        e = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" }, 
        b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toogle Breakpoint" }, 
        B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Condition Breakpoint" }, 
        p = { "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Log point" }, 
        R = { "<cmd>lua require'dap'.repl.open()<cr>", "Repl Open" }, 
        l = { "<cmd>lua require'dap'.run_last()<cr>", "Run last" }, 
        u = { "<cmd>lua require'dapui'.open()<cr>", "Open UI" }, 		
        },
    }, { prefix = "<leader>" })


    wk.register({
        f = {
            name = "Clang-Format", 
        f = { "<cmd>ClangFormat<cr>", "Format" }, 
            t = { "<cmd>ClangFormatAutoToggle<cr>", "Toogle Auto Format" }, 
        e = { "<cmd>ClangFormatAutoEnable<cr>", "Enable Auto Format" }, 
        d = { "<cmd>ClangFormatAutoDisable<cr>", "Disable Auto Format" }, 
        E = { "<cmd>ClangFormatEchoFormattedCode<cr>", "Echo Format" }, 
        },
    }, { prefix = "<leader>" })


    
    wk.register({
        T = {
            name = "Terminal", 
        t = { "<cmd>FloatermToggle<cr>", "Terminal" }, 
        l = { "<cmd>FloatermNew Lazygit<cr>", "Terminal" }, 
        },
    }, { prefix = "<leader>" })

        
    wk.register({
        c = {
            name = "Code", 
        a = { "<cmd>A<cr>", "Header" }, 
        h = { "<cmd>AS<cr>", "Header Split" }, 
        H = { "<cmd>AV<cr>", "Header Split Vertical" }, 
        b = { "<cmd>IH<cr>", "File under cursor" }, 
        c = { "<cmd>IHS<cr>", "File under cursor split" }, 
        c = { "<cmd>IHV<cr>", "File under cursor split vertical" }, 
        },
    }, { prefix = "<leader>" })

    wk.register({
        p = {
            name = "Preview", 
        d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Defination" }, 
        t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "Type" }, 
        i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" }, 
        c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close All" }, 
        r = { "<cmd>lua require('goto-preview').goto_preview_referances()<CR>", "Referance" }, 
        },
    }, { prefix = "<leader>" })

    wk.register({
        s = {
            "<cmd>TroubleToggle<CR>", "Trouble toggle"
        },
    }, { prefix = "<leader>" })

    --wk.register({
    --    e = {
    --        "<cmd>NvimTreeToggle<CR>", "Explorer"
    --    },
    --}, { prefix = "<leader>" })

    wk.register({
        b = {
            name = "Buffers", 
        p = { "<cmd>BufferPrevious<CR>", "Previous" }, 
        n = { "<cmd>BufferNext<CR>", "Next" }, 
        P = { "<cmd>BufferMovePrevious<CR>", "Move Previous" }, 
        N = { "<cmd>BufferMoveNext<CR>", "Move Next" }, 
        x = { "<cmd>BufferPin<CR>", "Pin" }, 
        X = { "<cmd>BufferPick<CR>", "Pick" }, 
        c = { "<cmd>BufferClose<CR>", "Close" }, 
        l = { "<cmd>BufferLast<CR>", "Last" }, 
        O = { "<cmd>BufferOrderByBufferNumber<CR>", "Order" }, 
        D = { "<cmd>BufferOrderByDirectory<CR>", "Order Directory" }, 
        L = { "<cmd>BufferOrderByLanguage<CR>", "Order Language" }, 
        W = { "<cmd>BufferOrderByWindowNumber<CR>", "Order Window" }, 
        },
    }, { prefix = "<leader>" })

    vim.api.nvim_set_keymap('n', '<leader>b1', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>b2', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>b3', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>b4', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>b5', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>b6', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>b7', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>b8', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>b9', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true })


end

local function zoe_treesitters_init()    
    require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "cuda", "cmake", "rust", "go", "glsl", "hlsl", "lua", "vim", "help" },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true
        }
    }
end

local function zoe_telescope_init()
    require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-h>"] = "which_key"
            }
          }
        },
        pickers = {
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,      
          },
        },
      }
      require("telescope").load_extension "file_browser"
      require('telescope').load_extension('dap')
end

local function zoe_dap_init()
    require("nvim-dap-virtual-text").setup()
    vim.api.nvim_set_keymap("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", { noremap = true })
    local dap = require('dap')

    local dap = require('dap')
    dap.adapters.codelldb = {
    type = 'server',
    executable = {
        command = vim.fn.stdpath('data')..'/mason/bin/codelldb.cmd',
        args = { '--port', '13000' },
        },
    host = '127.0.0.1',-- adjust as needed, must be absolute path
    name = 'codelldb', 
    port = 13000
    }

    local dap = require('dap')
    dap.configurations.cpp = {
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = true,
        },
    }

    require("neodev").setup({library = { plugins = { "nvim-dap-ui" }, types = true },})

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
end

local function zoe_notify_init()
    vim.notify = require("notify")
end

local function zoe_lualine_init()
    require('lualine').setup()
end

local function zoe_lint_init()
    require('lint').linters_by_ft = {
        markdown = {'vale',}
      }
    
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
end

local function zoe_gotopreview_init()
    require('goto-preview').setup {
        width = 120; 
        height = 15; 
        border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; 
        default_mappings = false; 
        debug = false; 
        opacity = nil; 
        resizing_mappings = false; 
        post_open_hook = nil; 
        references = { 
          telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
        };
        focus_on_open = true; 
        dismiss_on_move = false; 
        force_close = true, 
        bufhidden = "wipe", 
      }
      vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
      vim.keymap.set("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", {noremap=true})
      vim.keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", {noremap=true})
      vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
      vim.keymap.set("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_referances()<CR>", {noremap=true})
end


local function zoe_haskell_init()
    vim.g.haskell_enable_quantification = 1   
    vim.g.haskell_enable_recursivedo = 1      
    vim.g.haskell_enable_arrowsyntax = 1      
    vim.g.haskell_enable_pattern_synonyms = 1 
    vim.g.haskell_enable_typeroles = 1        
    vim.g.haskell_enable_static_pointers = 1  
    vim.g.haskell_backpack = 1               
    vim.g.hindent_on_save = 1
    vim.g.hindent_indent_size = 2
    vim.g.hindent_line_length = 100
    vim.g.hindent_command = "stack exec -- hindent"
end

local function zoe_lsp_init()
    local lsp = require('lsp-zero')
    lsp.preset('recommended')
    lsp.nvim_workspace()
    lsp.setup()
    require('go').setup({})
    
    --require("gopher").setup {
    --    commands = {
    --      go = "go",
    --      gomodifytags = "gomodifytags",
    --      gotests = "gotests", -- also you can set custom command path
    --      impl = "impl",
    --      iferr = "iferr",
    --    },
    --  }
    
end


local function zoe_nvimtree_init()
    vim.g.nvim_tree_quit_on_open = 0 
    require("nvim-tree").setup()
    local nvim_tree_events = require('nvim-tree.events')
    local bufferline_api = require('bufferline.api')

    local function get_tree_size()
    return require'nvim-tree.view'.View.width
    end

    nvim_tree_events.subscribe('TreeOpen', function()
    bufferline_api.set_offset(get_tree_size())
    end)

    nvim_tree_events.subscribe('Resize', function()
    bufferline_api.set_offset(get_tree_size())
    end)

    nvim_tree_events.subscribe('TreeClose', function()
    bufferline_api.set_offset(0)
    end)    
end

local function zoe_cmake_init() 

    require("cmake-tools").setup {
    cmake_command = "cmake",
    cmake_build_directory = "Build",
    cmake_build_directory_prefix = "", -- when cmake_build_directory is "", this option will be activated
    cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" ,
                            "-G",  "Ninja" },
    cmake_build_options = {},
    cmake_console_size = 10, -- cmake output window height
    cmake_console_position = "belowright", -- "belowright", "aboveleft", ...
    cmake_show_console = "always", -- "always", "only_on_error"
    cmake_dap_configuration = { name = "cpp", type = "codelldb", request = "launch" }, -- dap configuration, optional
    cmake_variants_message = {
      short = { show = true },
      long = { show = true, max_length = 40 }
    }
  }
end

local firstrun = zoe_packer_installer()

if not firstrun then
    zoe_settings_init()
    zoe_lsp_init()
    require("trouble").setup()
    --zoe_nvimtree_init()
    zoe_whichkey_init()
    zoe_treesitters_init()
    zoe_telescope_init()
    zoe_dap_init()
    zoe_notify_init()
    zoe_lualine_init()
    zoe_lint_init()
    zoe_gotopreview_init()   
    zoe_cmake_init() 
    vim.cmd("colorscheme adwaita") 
    require'hop'.setup()
else
    print("Please type :qa then reopen neovim")
end

if vim.g.neovide then
    --vim.g.neovide_scale_factor = 0.8
    --vim.g.neovide_transparency = 0.95
    --vim.g.transparency = 0.0
   -- vim.g.neovide_floating_blur_amount_x = 2.0
   -- vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_remember_window_size = true
    vim.opt.guifont = { "FiraCode NF", ":h8" }
end

