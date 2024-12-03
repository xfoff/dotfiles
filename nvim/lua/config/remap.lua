vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fx", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<leader>tt', ':vsp<CR>:term<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>tt', '<C-\\><C-n>:q<CR>', { noremap = true, silent = true })
vim.cmd([[
  augroup TerminalSettings
    autocmd!
    autocmd TermOpen * setlocal scrollback=10000
    autocmd TermOpen * startinsert
  augroup END
]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>P", "\"+p")
vim.keymap.set("v", "<leader>P", "\"+p")
vim.keymap.set("n", "<leader>w", ":w")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('x', '<leader><leader>', ":<C-u>call nerdcommenter#Comment('x', 'Toggle')<CR>", { noremap = true, silent = true })

vim.g.user_emmet_leader_key = '<C-y>'
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })
