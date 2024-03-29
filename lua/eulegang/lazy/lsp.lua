return {
    { "folke/neodev.nvim" },
    {
        'neovim/nvim-lspconfig',
        dir = "/home/eulegang/external/nvim-lspconfig",
        config = function()
            require("neodev").setup({
                -- add any options here, or leave empty to use the default settings
            })


            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setqflist)

            vim.keymap.set('n', '<c-k>', ':cprev<cr>')
            vim.keymap.set('n', '<c-j>', ':cnext<cr>')

            vim.keymap.set('n', 'gk', vim.diagnostic.goto_prev)
            vim.keymap.set('n', 'gj', vim.diagnostic.goto_next)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>k', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = vim.api.nvim_create_augroup('UserLspConfigFmtWrite', {}),
                        callback = function()
                            vim.lsp.buf.format()
                        end
                    })
                end,
            })
        end
    }
}
