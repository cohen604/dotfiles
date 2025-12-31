return {
    {
        'ellisonleao/gruvbox.nvim',
        as = 'gruvbox',
        config = function()
            vim.cmd('colorscheme gruvbox')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'gruvbox_dark'
                }
            })
        end
    },
    {
        'folke/trouble.nvim',
        as = 'trouble',
        keys = {
            {
                "<leader>dx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
        },
        config = function()
            require('trouble').setup()
        end
    }
}
