# Jinx Colorscheme + Snacks Dashboard

![images](./RM-images/dashboard.png)

# Jinx Neovim Configuration 💥

Welcome to **Jinx.nvim**, a personal Neovim configuration crafted for **speed, clarity, and flexibility** — inspired by the chaos and creativity of Jinx from _Arcane_. This setup works seamlessly on both **macOS** and **Linux**.

---

## 📂 Directory Structure

```text
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

Additionally, ensure Mason tools are in your `PATH`:

```sh
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
```

---

## 🚀 Setup Instructions

1. Clone this repo into `~/.config/nvim`.
2. Open Neovim to trigger automatic plugin installation via Lazy.nvim.
3. Run the following inside Neovim to install required tools:

```vim
:MasonInstall lua_ls pyright tsserver html cssls jsonls yamlls gopls rust_analyzer solargraph
:MasonInstall stylua black isort prettier rubocop gofumpt clang-format
```

---

## 🌈 Jinx Colorscheme

This config includes a custom `jinx` colorscheme built on top of `rose-pine`, styled to match the Jinx aesthetic:

| Element    | Color         |
| ---------- | ------------- |
| Text       | Pink          |
| Highlights | Electric Blue |
| Hints      | Neon Green    |
| Errors     | Red           |
| Comments   | Subtle Gray   |

---

## ⚡ Performance Tweaks

Several performance optimizations are included:

- Disabled unused providers (Python, Ruby, Node, Perl).
- Trimmed `runtimepath` to remove legacy Vim paths.
- Deferred plugin loading until actually needed.
- Removed unused plugins (`vimtex`, `processing`).
- Colorscheme loads first to prevent flickering.
- Pruned Treesitter to only essential parsers.

For full details, see:
➡️ [docs/performance-tweaks.md](./docs/performance-tweaks.md)

---

## 🔑 Complete Keybind Reference

This configuration features an extensive set of **custom keybinds**, covering file management, LSP actions, Telescope usage, Harpoon, DAP debugging, and more.

For a complete reference, see:
➡️ [docs/keybinds.md](./docs/keybinds.md)

---

## 🔥 Plugin Overview

| Plugin                                                                                       | Description                                       |
| -------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                                | Tabs and buffers line                             |
| [clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim)                     | Extra functionality for clangd LSP                |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                                          | Completion source for buffer words                |
| [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)                                        | Completion source for command line                |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                                      | Completion source for LSP                         |
| [cmp-path](https://github.com/hrsh7th/cmp-path)                                              | Completion source for filesystem paths            |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)                                   | Completion source for LuaSnip                     |
| [dooing](https://github.com/ldelossa/dooing)                                                 | Task management plugin                            |
| [flash.nvim](https://github.com/folke/flash.nvim)                                            | Navigation and motion plugin                      |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)                         | Predefined snippets collection                    |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                  | Git integration for buffers                       |
| [harpoon](https://github.com/ThePrimeagen/harpoon)                                           | Quick file navigation                             |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                                              | Plugin manager                                    |
| [luarocks.nvim](https://github.com/wbthomason/luarocks.nvim)                                 | LuaRocks package management                       |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                                               | Snippet engine                                    |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)                     | Live Markdown preview                             |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)                 | Integration between mason and lspconfig           |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)    | Auto-install tools via mason                      |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                                     | Package manager for LSP, DAP, linters, formatters |
| [maven.nvim](https://github.com/HiPhish/maven.nvim)                                          | Manage Maven dependencies                         |
| [mini.nvim](https://github.com/echasnovski/mini.nvim)                                        | Collection of minimal plugins                     |
| [modicator.nvim](https://github.com/mawkler/modicator.nvim)                                  | Mode indicator enhancement                        |
| [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)                                   | Smooth scrolling                                  |
| [noice.nvim](https://github.com/folke/noice.nvim)                                            | Improved command-line UI                          |
| [none-ls-extras.nvim](https://github.com/nvimtools/none-ls-extras.nvim)                      | Extra sources for none-ls                         |
| [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)                                    | General-purpose language server                   |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim)                                          | UI components library                             |
| [nvim](https://github.com/neovim/neovim)                                                     | Neovim itself                                     |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                              | Completion engine                                 |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap)                                         | Debug Adapter Protocol                            |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)                                       | UI for nvim-dap                                   |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)                  | Inline debug information                          |
| [nvim-emmet](https://github.com/aca/emmet.nvim)                                              | Emmet support for Neovim                          |
| [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)               | Highlight colors directly in code                 |
| [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)                                     | Java LSP support                                  |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                   | LSP configuration                                 |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio)                                         | Async IO library                                  |
| [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)                                    | Search and replace                                |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                        | Treesitter configuration                          |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)                          | File icons                                        |
| [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim)                                    | Obsidian integration                              |
| [persistence.nvim](https://github.com/folke/persistence.nvim)                                | Session management                                |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)                                     | Utility library                                   |
| [render-markdown.nvim](https://github.com/davidgranstrom/render-markdown.nvim)               | Render Markdown files                             |
| [rest.nvim](https://github.com/rest-nvim/rest.nvim)                                          | HTTP client                                       |
| [rose-pine](https://github.com/rose-pine/neovim)                                             | Colorscheme                                       |
| [smear-cursor.nvim](https://github.com/nyngwang/smear.nvim)                                  | Cursor effect                                     |
| [snacks.nvim](https://github.com/shinyuta/snacks.nvim)                                       | Custom plugin                                     |
| [substitute.nvim](https://github.com/gbprod/substitute.nvim)                                 | Enhanced substitution                             |
| [telescope-dap.nvim](https://github.com/nvim-telescope/telescope-dap.nvim)                   | DAP integration with Telescope                    |
| [telescope-project.nvim](https://github.com/nvim-telescope/telescope-project.nvim)           | Project management in Telescope                   |
| [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)       | Better UI for select                              |
| [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide)                          | Zoxide integration                                |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                           | Fuzzy finder                                      |
| [tiny-devicons-auto-colors.nvim](https://github.com/adelarsq/tiny-devicons-auto-colors.nvim) | Auto-colored devicons                             |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)                                | Terminal management                               |
| [transparent.nvim](https://github.com/xiyaowong/transparent.nvim)                            | Transparency for Neovim                           |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                                        | Diagnostics list UI                               |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)                      | Seamless navigation between vim and tmux          |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                                    | Keybinding helper                                 |
| [yanky.nvim](https://github.com/gbprod/yanky.nvim)                                           | Clipboard history                                 |
| [yazi.nvim](https://github.com/mnaoqo/yazi.nvim)                                             | Yazi file manager integration                     |

---

## 🛠️ Debugging Tools

| Command         | Purpose                   |
| --------------- | ------------------------- |
| `:Lazy profile` | Profile plugin load times |
| `:LspInfo`      | Show active LSP servers   |
| `:checkhealth`  | Diagnose general issues   |
| `:verbose map`  | Show mapped keys          |

---

## 📓 Obsidian.nvim Workflow

This configuration also supports a **full Obsidian.nvim workflow**, allowing you to manage:

- Personal notes
- School notes
- Essays and projects

The default wiki directory is:

```text
~/Desktop/wiki/
```

For a complete breakdown of the Obsidian workflow, see:
➡️ [docs/obsidian.md](docs/obsidian.md)

---

## 🎉 Final Tip

This configuration is designed to be **future-proof**. Adding new plugins, adapting to new workflows, or adjusting settings should be quick and painless. Embrace the chaos and enjoy your **Jinx-powered Neovim!** 💥
