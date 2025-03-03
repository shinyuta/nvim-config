
# Jinx Colorscheme + Snacks Dashboard

![images](./RM-images/dashboard.png)
# Jinx Neovim Configuration 💥

Welcome to **Jinx.nvim**, a personal Neovim configuration crafted for **speed, clarity, and flexibility** — inspired by the chaos and creativity of Jinx from *Arcane*. This setup is designed to shine on both **macOS** and **Linux**.

---

## 📂 Directory Structure

```
~/.config/nvim/
├── init.lua              # Main entrypoint
├── lua/
│   ├── core/              # Core settings (options, keybinds, autocmds, etc.)
│   ├── plugins/           # Individual plugin configurations
├── colors/                 # Custom colorschemes
├── docs/                    # Documentation and performance notes
├── ftplugin/               # Filetype-specific tweaks
```

---

## 💻 System Requirements

### macOS
```sh
brew install neovim ruby node python3
```

### Ubuntu/Linux
```sh
sudo apt-get install neovim ruby nodejs python3
```

And make sure Mason tools are in your path:
```sh
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
```

---

## 🚀 Setup Instructions

1. Clone this repo into `~/.config/nvim`.
2. Open Neovim to trigger plugin installation via Lazy.nvim.
3. Run:
```vim
:MasonInstall lua_ls pyright tsserver html cssls jsonls yamlls gopls rust_analyzer solargraph
:MasonInstall stylua black isort prettier rubocop gofumpt clang-format
```

---

## 🌈 Jinx Colorscheme

Built around `rose-pine`, re-styled to fit the **Jinx aesthetic**:
| Element              | Color |
|------------------|------|
| Text                  | Pink |
| Highlights            | Electric Blue |
| Hints                  | Neon Green |
| Errors                 | Red |
| Comments            | Subtle Gray |

---

## ⚡ Performance Tweaks

This setup has several performance improvements baked in:

- Disabled unused providers (Python, Ruby, Node, Perl).
- Trimmed `runtimepath` to remove legacy Vim paths.
- Deferred plugin loading until actually needed.
- Removed unused plugins (`vimtex`, `processing`).
- Colorscheme loads first to avoid flickering.
- Pruned Treesitter to only required parsers.

For full details, see:
👉 [docs/performance-tweaks.md](./docs/performance-tweaks.md)

---

## 🔑 Keybind Reference

| Keybind      | Action                          |
|--------------|---------------------------------|
| `<leader>ld` | Open file diagnostics (Telescope) |
| `<leader>gf` | Smart format current file       |
| `<leader>l`  | Open Lazy plugin manager        |
| `<leader>k`  | Open keybinds file               |
| `<leader>ha` | Add file to Harpoon (or open if already added) |

Complete list in:
👉 [lua/core/keybinds.lua](./lua/core/keybinds.lua)

---

## 🔥 Plugins (With Links & Purpose)

| Plugin | Purpose | GitHub Link |
|---|---|---|
| bufferline.nvim | Tabline for buffers | [nvim-bufferline](https://github.com/akinsho/bufferline.nvim) |
| cmp-* | Autocompletion sources | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) |
| dooing | Task management | [dooing](https://github.com/akinsho/dooing.nvim) |
| flash.nvim | Motion plugin | [flash.nvim](https://github.com/folke/flash.nvim) |
| gitsigns.nvim | Git integration | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) |
| harpoon | Quick file navigation | [harpoon](https://github.com/ThePrimeagen/harpoon) |
| lazy.nvim | Plugin manager | [lazy.nvim](https://github.com/folke/lazy.nvim) |
| mason.nvim | LSP/Formatter manager | [mason.nvim](https://github.com/williamboman/mason.nvim) |
| mason-lspconfig.nvim | Mason + LSP config | [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) |
| mason-tool-installer.nvim | Auto-install tools | [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) |
| mini.nvim | Collection of small tools | [mini.nvim](https://github.com/echasnovski/mini.nvim) |
| noice.nvim | Command-line replacement | [noice.nvim](https://github.com/folke/noice.nvim) |
| none-ls.nvim | Formatter & linter (null-ls successor) | [none-ls](https://github.com/nvimtools/none-ls.nvim) |
| nvim-cmp | Main completion engine | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) |
| nvim-dap | Debug Adapter Protocol | [nvim-dap](https://github.com/mfussenegger/nvim-dap) |
| nvim-dap-ui | UI for DAP | [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) |
| nvim-lspconfig | LSP server configs | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) |
| nvim-spectre | Search & Replace | [nvim-spectre](https://github.com/nvim-pack/nvim-spectre) |
| nvim-treesitter | Syntax highlighting | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| telescope.nvim | Fuzzy finder | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) |
| telescope-project.nvim | Project picker | [telescope-project](https://github.com/nvim-telescope/telescope-project.nvim) |
| telescope-zoxide | Zoxide directory picker | [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide) |
| toggleterm.nvim | Integrated terminal | [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) |
| transparent.nvim | Optional transparency | [transparent.nvim](https://github.com/xiyaowong/transparent.nvim) |
| trouble.nvim | Diagnostics viewer | [trouble.nvim](https://github.com/folke/trouble.nvim) |
| which-key.nvim | Keybind helper | [which-key.nvim](https://github.com/folke/which-key.nvim) |
| yanky.nvim | Yank history | [yanky.nvim](https://github.com/gbprod/yanky.nvim) |

---

## 🛠️ Debugging Tools

| Command | Purpose |
|---|---|
| `:Lazy profile` | Profile plugin load times |
| `:LspInfo` | See active LSP servers |
| `:checkhealth` | Verify overall health |
| `:verbose map` | Show mapped keys |

---

## 🎉 Final Tip

This configuration is built to be **future-proof**. Adding new plugins, swapping tools, or adapting for new workflows is designed to be fast and painless. Enjoy your **Jinx-powered Neovim!** 💥
