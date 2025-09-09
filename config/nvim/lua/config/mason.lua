require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = { 
    "lua_ls";
    "rust_analyzer",
    "vimls",
    "bashls",
    "html",
    "pyright"
},
     automatic_enable = {
        "rust_analyzer",
        "vimls",
        "html",
        "bashls",
        "pyright",
    }
}

