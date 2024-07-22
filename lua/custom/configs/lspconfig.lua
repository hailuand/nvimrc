local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

-- Python
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})
-- Go
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  },
}
-- Svelte
lspconfig.svelte.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"svelte"},
})
-- C#
lspconfig.csharp_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"cs"}
})
-- Markdown
lspconfig.marksman.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"markdown"},
})

for _, lsp in ipairs {"tsserver", "tailwindcss", "eslint", "cssls"} do
  lspconfig[lsp].setup {}
end
