# Neovim Performance Tweaks (Jinx Config)

This document collects all the **speed and performance optimizations** applied to your Neovim configuration, along with explanations and future-proofing notes.

---

## ✅ Disabled Unused Providers

Neovim supports external scripting languages like Python, Ruby, Node, and Perl — but these are almost never needed in a modern Lua-based config. Disabling them saves time during startup.

### Added to `options.lua`:

```lua
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
```

---

## ✅ Trimmed Runtimepath

Neovim's `runtimepath` often includes unnecessary legacy Vim paths (like `~/.vim`). These were removed, leaving only essential paths for Neovim itself and Lazy.nvim.

### Added to `options.lua`:

```lua
local unwanted_paths = {
    vim.fn.expand("~/.vim"),
    vim.fn.expand("~/.vim/after"),
    "/usr/share/vim/vimfiles",
    "/usr/local/share/vim/vimfiles",
}

for _, path in ipairs(unwanted_paths) do
    vim.opt.runtimepath:remove(path)
end
```

---

## ✅ Deferred Non-Essential Plugins

Some plugins, like `mason` and `mason-tool-installer`, were set to always load on startup. These were changed to only load **when actually needed**.

### New Loading Rules:

| Plugin                    | Trigger                  |
| ------------------------- | ------------------------ |
| mason.nvim                | `:Mason` only            |
| mason-tool-installer.nvim | `:MasonToolsUpdate` only |
| telescope.nvim            | `:Telescope` only        |

This reduced initial plugin load dramatically.

---

## ✅ Filetype-Based Loading

Plugins like `vimtex` (now removed) were set to load on all filetypes. This was replaced with filetype-specific loading so only relevant plugins load.

---

## ✅ Removed Unused Plugins

Several plugins were removed completely for faster startup:

| Plugin               | Reason                     |
| -------------------- | -------------------------- |
| vimtex               | No LaTeX work is done      |
| vim-processing       | Processing language unused |
| telescope-simulators | No mobile development      |

---

## ✅ Treesitter Language List Pruned

`nvim-treesitter` was updated to only install parsers for languages you actually use:

```lua
ensure_installed = {
    "lua", "javascript", "typescript", "python",
    "json", "yaml", "html", "css", "bash",
    "markdown", "markdown_inline", "rust", "go", "c"
}
```

This prevents unnecessary downloads and parsing overhead.

---

## ✅ Colorscheme Priority Set

Your colorscheme (`rose-pine`) was given **priority = 1000** to ensure it loads **before all other plugins**. This prevents any color flashing on startup.

---

## ✅ Diagnostic Lazy Profiling

You now have the habit of running:

```vim
:Lazy profile
```

This allows you to detect slow plugins if any are added in the future.

---

## ✅ Optional Neovim Defaults Removed

These were not applied automatically yet, but you could disable some default Neovim runtime files if desired:

```lua
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
```

This is optional — useful if you replace file browsing (like with snacks or yazi).

---

## ✅ AutoCmd Cleanup (Optional Future Step)

Your autocommands should always be **grouped** and only applied to needed filetypes to avoid unnecessary triggers.

```lua
vim.api.nvim_create_augroup("MyNeovimTweakGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "MyNeovimTweakGroup",
    pattern = { "markdown", "text" },
    command = "setlocal spell",
})
```

---

## ⚡ Final Tip

Whenever adding a **new plugin**, always check:

- Does it need to load at startup? If not, defer it using `cmd`, `ft`, or `event`.
- Does it need to be in `ensure_installed` for Treesitter?
- Does it introduce new providers (Python, Node, etc.)?

Use:

```vim
:Lazy profile
```

After every plugin change to catch slowdowns immediately.

---

This document should live at:

```
~/.config/nvim/docs/performance-tweaks.md
```
