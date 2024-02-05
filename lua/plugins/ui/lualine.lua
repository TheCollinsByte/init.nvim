local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	return
end

local icons = require('lib.icons')

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        -- section_separators = '',
        theme = 'gruvbox',
        disabled_filetypes = {
            'dashboard',
        },
    },
    -- extensions = { 'quickfix', 'man', 'mason', 'lazy', 'toggleterm', 'nvim-tree' },
    tabline = {
        lualine_a = {},
        lualine_b = { mode(), { 'buffers', use_mode_colors = true } },
        lualine_c = {},
        lualine_x = { diff_icons, branch },
        lualine_y = { searchcount, selectioncount },
        lualine_z = {}
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { separator, mode(icons.ui.Heart), 'location', progress, filename },
        lualine_x = { diagnostics, lsp, filetype, filesize, fileformat, encoding, separator },
        lualine_y = {},
        lualine_z = {},
    },
}

-- Initializing lualine
lualine.setup(config)
