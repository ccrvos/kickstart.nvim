-- lua/config/keymaps.lua
local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.keymap.set
-- Movement remaps (vim style)
keymap('n', 'ö', 'l', opts) -- Right
keymap('n', 'l', 'j', opts) -- Down
keymap('n', 'j', 'h', opts) -- Left
-- Also add for visual mode
keymap('v', 'ö', 'l', opts)
keymap('v', 'l', 'j', opts)
keymap('v', 'j', 'h', opts)
-- And operator-pending mode (for commands like d, y, c)
keymap('o', 'ö', 'l', opts)
keymap('o', 'l', 'j', opts)
keymap('o', 'j', 'h', opts)

-- Execute Python file
keymap('n', '<leader>rp', function()
  vim.cmd 'w' -- Save the file
  vim.cmd 'split' -- Split the window
  vim.cmd('terminal python3 ' .. vim.fn.expand '%') -- Run in terminal
end, { desc = 'Run Python file in split' })

-- Insert empty Python code chunk
keymap({ 'n', 'i' }, '<m-i>', '<esc>i```{python}<cr>```<esc>0', { desc = '[i]nsert python code chunk' })

-- Split and open ipython3 terminal
keymap('n', '<leader>ci', ':vsplit term://ipython3<cr>', { desc = 'split and open ipython3 terminal' })

-- Remove line number in ipython3 terminal
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Remove line numbers in ipython3 terminal',
  group = vim.api.nvim_create_augroup('kickstart-term', { clear = true }),
  callback = function()
    vim.wo.number = false
  end,
})
