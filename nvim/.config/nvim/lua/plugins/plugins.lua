return {
    {
        'ellisonleao/gruvbox.nvim',
        as = 'gruvbox',
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'nightfox'
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
