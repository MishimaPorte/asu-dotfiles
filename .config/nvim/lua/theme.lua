local hl = vim.api.nvim_set_hl

vim.cmd[[colorscheme tokyonight-night]]

-- here lies the custom themeing, let the Lord forgive me
vim.api.nvim_command("highlight @module guifg=#b46695")
-- vim.api.nvim_command("highlight @importstmt guifg=#b46695")
