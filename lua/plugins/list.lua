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
