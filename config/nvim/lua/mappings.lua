local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<C-P>", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-G>", ":Telescope live_grep<CR>", opts)

local os = vim.loop.os_uname().sysname

vim.api.nvim_set_keymap("n", (os == 'Darwin' and "<C-/>" or "<C-_>" ), ":call nerdcommenter#Comment('n', 'toggle')<CR>", opts)
vim.api.nvim_set_keymap("v", (os == 'Darwin' and "<C-/>" or "<C-_>" ), ":call nerdcommenter#Comment('x', 'toggle')<CR>", opts)

vim.api.nvim_set_keymap("n", "<C-f>", ":NvimTreeToggle<CR>", opts)
