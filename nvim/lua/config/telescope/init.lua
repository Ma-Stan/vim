local km=vim.api.nvim_set_keymap
km('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
km('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
km('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
km('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})

-- require('config.telescope.telescope-large-fix')
