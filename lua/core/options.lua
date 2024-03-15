local opt = vim.opt


-- Tab / Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.showtabline = 0
opt.expandtab = true  -- Convert tabs to spaces
opt.smartindent = true
opt.wrap = false    -- display lines as one long line

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false				-- highlight all matches on previous search pattern


-- Appearance
opt.number = true					-- Set numbered lines
opt.relativenumber = true 			-- Set relative numbered lines
opt.termguicolors = true
opt.scrolloff = 10


-- Behaviour
opt.clipboard:append('unnamedplus')	-- allows neovim to access the system clipboard
opt.mouse:append('a') 				-- allow the mouse to be used in neovim
opt.cursorline = true				-- highlight the current line
opt.encoding = 'UTF-8'
opt.fileencoding = 'UTF-8'
opt.confirm = true 					-- Confirm to save changes before exiting modified buffer
