local util = {}

util.is_present = function(bin)
    return vim.fn.executable(bin) == 1
end

util.telescope_select = function(options, options_desc, select_prompt)
    require('telescope.pickers')
        .new({}, {
            prompt_title = select_prompt,
            results_title = options_desc,
            finder = require('telescope.finders').new_table({
                results = options,
                entry_maker = require('telescope.make_entry').gen_from_file(),
            }),
            sorter = require('telescope.sorters').get_fzy_sorter(),
            previewer = require('telescope.previewers').vim_buffer_cat.new({}),
        })
        :find()
end

return util
