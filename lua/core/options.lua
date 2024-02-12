local opt = vim.opt


-- Tab / Indentation
opt.tabstop = 4
opt.smartindent = true
opt.wrap = false					-- Display lines as one long line 


-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false


-- Appearance
opt.number = true					-- Set numbered lines
opt.relativenumber = true 			-- Set relative numbered lines
opt.termguicolors = true


-- Behaviour
opt.clipboard:append('unnamedplus')	-- allows neovim to access the system clipboard
opt.cursorline = true				-- highlight the current line
