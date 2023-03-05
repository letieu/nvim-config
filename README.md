# nvim-config
My neovim configuration. ⚡ Power full and 🔸 minimalist.

Powered lspconfig, mason, treesitter, nvim-cmp, github copilot and more.

## Preview
<img src="https://github.com/letieu/images/blob/master/github-preview/nvim-gruv.png?raw=true" />

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
├── init.lua
└── lua
    ├── autocmd.lua
    ├── diagnostic.lua
    ├── hl.lua
    ├── mappings.lua
    ├── options.lua
    └── plugins
        ├── lsp
        │   ├── bun.lua
        │   ├── init.lua
        │   └── utils.lua
        ├── cmp.lua
        ├── copilot.lua
        ├── diffview.lua
        ├── gitsigns.lua
        ├── gruvbox.lua
        ├── harpoon.lua
        ├── init.lua
        ├── lualine.lua
        ├── mason.lua
        ├── nvim-tree.lua
        ├── satellite.lua
        ├── statuscol.lua
        ├── telescope.lua
        ├── todo-comments.lua
        ├── treesitter.lua
        └── ufo.lua

```
