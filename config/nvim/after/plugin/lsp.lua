local lsp = require("lsp-zero")
local cmp = require('cmp')

local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
})

lsp.preset("recommended")
lsp.setup_nvim_cmp({
    sources = {
        { name = 'path' },
        { name = 'git' },
        { name = "luasnip" },
        { name = 'nvim_lsp', keyword_length = 3 },
        { name = 'buffer', keyword_length = 3 },
    },
    mapping = cmp_mappings
})
lsp.configure("eslint", {
    handlers = {
        ['window/showMessageRequest'] = function(_, result, _) return result end
    }
})
lsp.configure("tailwindcss", {
    settings = {
        tailwindCSS = {
            classAttributes = { "class", "className", "ngClass", "class:list" }
        }
    }
})
lsp.configure("jsonls", {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true }
        }
    }
})
lsp.configure("yamlls", {
    settings = {
        yaml = {
            schemas = require("schemastore").json.schemas()
        }
    }
})
lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = true,
})

vim.keymap.set("n", "<leader>p", vim.cmd.LspZeroFormat)
