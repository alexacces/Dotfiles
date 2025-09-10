vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- simbol di depan pesan
    spacing = 2,  -- jarak dari teks kode
  },
    signs = {
      text = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.INFO] = "󰋼 ",
              [vim.diagnostic.severity.HINT] = "󰌵 ",
      },
      texthl = {
              [vim.diagnostic.severity.ERROR] = "Error",
              [vim.diagnostic.severity.WARN] = "Error",
              [vim.diagnostic.severity.HINT] = "Hint",
              [vim.diagnostic.severity.INFO] = "Info",
      },
      numhl = {
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN] = "",
              [vim.diagnostic.severity.HINT] = "",
              [vim.diagnostic.severity.INFO] = "",
      },
        },
  underline = true,      -- garis bawah teks error
  update_in_insert = true, -- tetap tampil meski lagi mengetik
  severity_sort = true,  -- urutkan error > warning > info > hint
})
local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

local project_dir = vim.fn.getcwd()
local runtime_paths = vim.api.nvim_get_runtime_file("", true)
local filtered_paths = {}

for _, path in ipairs(runtime_paths) do
  if (path:match("/share/nvim/") or path:match("/site/pack/") or path:match(project_dir)) then
    table.insert(filtered_paths, path)
  end
end

lspconfig.lua_ls.setup({
    cmd = { "/etc/profiles/per-user/dev/bin/lua-language-server" },
    capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = filtered_paths,
        checkThirdParty = false, -- matikan scanning library pihak ketiga
      },
      telemetry = { enable = false },
    },
  },
})

local nvim_lsp = require("lspconfig")
nvim_lsp.nil_ls.setup({
   settings = {
      nil_ls = {
         formatting = {
            command = { "nixfmt" },
         },
      },
   },
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.nix",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

