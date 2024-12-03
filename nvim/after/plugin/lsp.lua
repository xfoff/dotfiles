require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {'ts_ls', 'solidity_ls', 'rust_analyzer', 'clangd', 'omnisharp', 'pyright', 'html', 'cssls', 'glsl_analyzer'},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({ capabilities = require('cmp_nvim_lsp').default_capabilities() })
        end,
    },
})

require('lsp_signature').setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    },
    wrap = true,
    transparency = 15,
    hint_enable = true,
    hint_prefix = {
        above = "↙ ",
        current = "🐼 ",
        below = "↖ "
    },
    hint_scheme = "String",
    max_width = 120,
})

local cmp = require('cmp')

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    formatting = {
        format = require('lspkind').cmp_format({ with_text = true, maxwidth = 50 })
    }
})

local lspconfig = require('lspconfig')
