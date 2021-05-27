local km=vim.api.nvim_set_keymap
vim.api.nvim_set_keymap('n', '==', '<cmd>Autoformat<cr>', {noremap = true})
vim.api.nvim_set_var('formatters_python',{'yapf'})
