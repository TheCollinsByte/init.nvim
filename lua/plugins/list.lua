local function load_config(package)
    return function() require('plugins.' .. package) end
end

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
	
	-- Language
	
	
	-- Treesitter
	

	-- LSP
	 

	-- Completion
	 

	-- Tools
	 

	-- Telescope
	'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
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

	-- Git
}
