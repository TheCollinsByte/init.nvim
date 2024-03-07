local function load_config(package)
    return function() require('plugins.' .. package) end
end

local keymap = vim.keymap

return {
	-- UI
	{
		'ellisonleao/gruvbox.nvim',
		config = load_config('ui.gruvbox'),
		lazy = false,
		priority = 1000,
	},

	{
		'nvimdev/dashboard-nvim',
		config = load_config('ui.dashboard'),
		dependencies = {
				'nvim-tree/nvim-web-devicons',
		},
		-- Only load when no arguments
		event = function()
		    if vim.fn.argc() == 0 then
			return 'VimEnter'
		    end
		end,
		cmd = 'Dashboard',
		},

	{
		'rcarriga/nvim-notify',
		config = load_config('ui.notify'),
		event = 'VeryLazy',
		cmd = 'Notifications',
	},

	{
        	'nvim-lualine/lualine.nvim',
        	config = load_config('ui.lualine'),
        	event = { 'BufReadPre', 'BufNewFile' },
    	},

	{
		'folke/noice.nvim',
		config = load_config('ui.noice'),
		event = 'VeryLazy',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify'
		},
	},
	-- Language

	-- Treesitter

	-- Native LSP
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		priority = 1000,
		dependencies = {
				'williamboman/mason.nvim',
				'williamboman/mason-lspconfig.nvim',
		},
	},

	{
		'williamboman/mason.nvim',
		config = load_config('lang.mason'),
		cmd = 'Mason',
	},

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		dependencies = {
		    'neovim/nvim-lspconfig',
		    'williamboman/mason-lspconfig.nvim',
		},
		config = load_config('lang.lsp-zero'),
		event = { 'BufReadPre', 'BufNewFile' },
	},



	-- Completion
    {
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
		    'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',

            -- 'saadparwaiz1/cmp_luasnip',
            -- 'hrsh7th/cmp-nvim-lsp-signature-help',
            -- 'hrsh7th/cmp-nvim-lua',
		},
		config = load_config('lang.cmp'),
		event = 'InsertEnter',
    },


	{
			'L3MON4D3/LuaSnip',
			version = "v2.*",
			dependencies = { 'rafamadriz/friendly-snippets' },
			build = "make install_jsregexp",
			event = "InsertEnter"
	},


	-- Tools
	{
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = load_config('tools.nvim-tree'),
        cmd = 'NvimTreeToggle',
    },

	{
		'epwalsh/obsidian.nvim',
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
				'nvim-lua/plenary.nvim',
		},
		opts = {
		},
	},


	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		lazy = false,
		dependencies = {
		    'nvim-lua/plenary.nvim',
		    {
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
		    },
		    'nvim-telescope/telescope-symbols.nvim',
		    'molecule-man/telescope-menufacture',
		    'debugloop/telescope-undo.nvim',
		    'ThePrimeagen/harpoon',
		},
		config = load_config('tools.telescope'),
		cmd = 'Telescope',
		keys = {
				keymap.set("n", "<leader>fk", "<Cmd>Telescope keymaps<CR>"),
				keymap.set("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>"),
				keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>"),
				keymap.set("n", "<leader>fa", "<Cmd>Telescope <CR>"),
				keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>"),
				keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>"),
		}
	}

	-- Git
}
