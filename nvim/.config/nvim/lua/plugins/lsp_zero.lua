return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            local lsp_servers = { 'lua_ls', 'texlab', 'marksman', 'tofu_ls',
                'pyright', 'ts_ls', 'astro', 'sqlls', 'svelte', 'tailwindcss' }

            -- vim.lsp.config.texlab.setup({})
            -- vim.lsp.config.marksman.setup({})
            -- vim.lsp.config.pyright.setup({})
            -- vim.lsp.config.ts_ls.setup({})
            -- vim.lsp.config.sqlls.setup({})
            -- vim.lsp.config.svelte.setup({})
            vim.lsp.config.tofu_ls = {
                cmd = { 'tofu-ls', 'serve' },
                -- Base filetypes
                filetypes = { 'terraform', 'terraform-vars' },
                root_markers = { '.terraform', '.git' },
            }
            vim.lsp.config.tailwindcss = ({
                settings = {
                    tailwindCSS = {
                        includeLanguages = { "html", "astro", "tailwindcss", "typescript" }
                    }
                }
            })

            vim.lsp.enable({'tofu_ls'})

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = lsp_servers,
                handlers = nil
            })


            local cmp = require('cmp')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- local cmp_select = {behavior = cmp.SelectBehavior.Select}
            local cmp_mappings = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            })

            cmp_mappings['<Tab>'] = nil
            cmp_mappings['<S-Tab>'] = nil

            cmp.setup({
                mapping = cmp_mappings,
                sources = {
                    -- Copilot Source
                    -- { name = "copilot", group_index = 2 },
                    -- Other Sources
                    { name = "nvim_lsp", group_index = 2 },
                    { name = "path",     group_index = 2 },
                    { name = "luasnip",  group_index = 2 },
                },
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
            })

            -- local signs = { Error = 'E', Warn = 'W', Hint = 'H', Info = 'I' }
            -- for type, icon in pairs(signs) do
            --     local hl = "DiagnosticSign" .. type
            --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            -- end

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end, opts)
                end,
            })
        end

    },
    {
        'mrcjkb/rustaceanvim',
        version = '^6',
        ft = { 'rust' },
        lazy = false,
        opts = {
            server = {
                on_attach = function(client, bufnr)
                    local opts = { buffer = bufnr }
                    vim.keymap.set("n", "<leader>ct", function() vim.cmd.RustLsp('openCargo') end, opts)
                    vim.keymap.set("n", "<leader>x", function() vim.cmd.RustLsp('hover', 'actions') end, opts)
                    vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp('codeAction') end, opts)
                    vim.keymap.set("n", "<leader>cem", function() vim.cmd.RustLsp('expandMacro') end, opts)
                end,
                default_settings = {
                    -- rust-analyzer language server configuration
                    ['rust-analyzer'] = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            runBuildScripts = true,
                        },
                        checkOnSave = true,
                    },
                },
            },
        },
        config = function(_, opts)
            vim.g.rustaceanvim = vim.tbl_deep_extend("force",
                {},
                opts or {})
        end
    }
}
