local hl = vim.api.nvim_set_hl

require "tokyonight" .setup {
  transparent = true, -- Enable this to disable setting the background color
  styles = {
    sidebars = "transparent", -- Style for sidebars, can be "dark", "transparent" or "normal"
    floats = "transparent",   -- Style for floating windows
  },
}

vim.cmd[[colorscheme tokyonight-night]]

-- here lies the custom themeing, let the Lord forgive me
vim.api.nvim_command[[highlight @module guifg=#b46695]]
vim.api.nvim_command[[highlight @comment guifg=#ff007f]]
-- vim.api.nvim_command("highlight @importstmt guifg=#b46695")
