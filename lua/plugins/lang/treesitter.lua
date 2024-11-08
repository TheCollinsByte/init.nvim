local treesitter = require('nvim-treesitter.configs')
local textobjects = require('plugins.lang.textobjects')

treesitter.setup({
    ensure_installed = {
        'bash',
        'css',
        'dart',
        'elixir',
        'gitcommit',
        'go',
        'html',
        'java',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline', -- markdown code blocks
        'python',
        'ruby',
        'rust',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
    },
    sync_install = false,
    ignore_install = {},
    auto_install = true,

    textobjects = textobjects,
    autopairs = { enable = true },
    endwise = { enable = true },
    autotag = { enable = true },
    matchup = { enable = true },
    indent = { enable = true },

    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
        },
    },

    textsubjects = {
        enable = true,
        prev_selection = ',',
        keymaps = {
            ['.'] = { 'textsubjects-smart', desc = 'Select the current text subject' },
            ['a;'] = {
                'textsubjects-container-outer',
                desc = 'Select outer container (class, function, etc.)',
            },
            ['i;'] = {
                'textsubjects-container-inner',
                desc = 'Select inside containers (classes, functions, etc.)',
            },
        },
    },

    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        highlight_current_scope = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = '<leader>rr',
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = '<leader>rd',
                list_definitions = '<leader>rl',
                list_definitions_toc = '<leader>rh',
                goto_next_usage = '<leader>rj',
                goto_previous_usage = '<leader>rk',
            },
        },
    },
})
