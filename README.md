# nvim-config
My neovim configuration. ⚡ Power full and 🔸 minimalist.

Powered lspconfig, mason, treesitter, nvim-cmp, github copilot and more.

<a href="https://dotfyle.com/plugins/letieu/hacker.nvim">
	<img src="https://dotfyle.com/plugins/letieu/hacker.nvim/shield?style=flat" />
</a> 
<a href="https://dotfyle.com/plugins/letieu/harpoon-lualine">
	<img src="https://dotfyle.com/plugins/letieu/harpoon-lualine/shield?style=flat" />
</a>

## Preview
<img width="1043" alt="Screenshot 2024-04-10 at 11 36 40 PM" src="https://github.com/letieu/nvim-config/assets/53562817/8d905cc1-d92e-411b-becb-268caa379e33">


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
