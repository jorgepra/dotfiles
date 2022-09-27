local nnoremap = require("thordog.keymap").nnoremap

-- Explorer
nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>pb", "<cmd>Rex<CR>")
nnoremap("<leader>pr", "<cmd>Vex!<CR>")


--vim.api.nvim_set_keymap('c', '<expr><up>', 'pumvisible() ? "\\<C-p>" : "\\<up>"', {expr = true})
--vim.api.nvim_set_keymap('c', '<expr><down>', 'pumvisible() ? "\\<C-n>" : "\\<down>"', {expr = true})


