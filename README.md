# nvim-config
My neovim configuration. ⚡ Power full and 🔸 minimalist.

Powered lspconfig, mason, treesitter, nvim-cmp, github copilot and more.

## Preview
<img src="https://github.com/letieu/images/blob/master/github-preview/nvim-github-light.png?raw=true" />

## Setup

```bash
git clone https://github.com/letieu/nvim-config ~/.config/nvim
```

## Easy to add new lsp
1. Add lsp server name to `lua/plugins/lsp/init.lua`
2. Install server by `MasonInstall <server_name>`
3. Install treesitter for highlight `TSInstall <name>` 

## Folder structure
```bash
nvim
├── README.md
├── init.lua
└── lua
    ├── autocmd.lua
    ├── diagnostic.lua
    ├── lsp
    │   ├── init.lua
    │   └── utils.lua
    ├── mappings.lua
    ├── options.lua
    └── plugins
        ├── cmp.lua
        ├── copilot.lua
        ├── diffview.lua
        ├── flutter-tools.lua
        ├── github-nvim-theme.lua
        ├── hardtime.lua
        ├── harpoon.lua
        ├── hawtkeys.lua
        ├── highlight-undo.lua
        ├── init.lua
        ├── lua-snip.lua
        ├── lualine.lua
        ├── markdown-preview.lua
        ├── mason.lua
        ├── nvim-lsp-file-operations.lua
        ├── nvim-navbuddy.lua
        ├── nvim-tree.lua
        ├── satellite.lua
        ├── telescope.lua
        ├── treesitter.lua
        ├── treesj.lua
        ├── ufo.lua
        └── undo-tree.lua
```
