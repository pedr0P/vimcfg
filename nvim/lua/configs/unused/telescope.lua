local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<C-c>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<C-c>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<C-c>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<C-c>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<C-c>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-c>g', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<C-c>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<C-c>h', builtin.help_tags, { desc = 'Telescope help tags' })
