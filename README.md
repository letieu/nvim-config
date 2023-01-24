# nvim-config
My neovim configuration. ⚡ Power full and 🔸 minimalist.
For `rust`, `lua` and web stuff, github copilot

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
    ├── mappings.lua
    ├── options.lua
    └── plugins
        ├── init.lua
        ├── cmp.lua
        ├── copilot.lua
        ├── harpoon.lua
        ├── lsp
        │   ├── init.lua
        │   └── utils.lua
        ├── mason.lua
        ├── nvim-tree.lua
        ├── telescope.lua
        ├── theme.lua
        └── treesitter.lua
```
