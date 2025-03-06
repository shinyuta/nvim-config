# Neovim Keybind Documentation

## 🥨 Snacks Keybinds

### Core Snacks Keybinds

| Keybind      | Action                    |
| ------------ | ------------------------- |
| `<leader>dn` | Hide Snacks notifications |
| `<leader>rF` | Rename current file       |
| `<leader>zz` | Toggle Snacks Zen mode    |

### Lazygit Integration

| Keybind       | Action                 |
| ------------- | ---------------------- |
| `<leader>lg`  | Open Lazygit           |
| `<leader>gb`  | Git blame current line |
| `<leader>gB`  | Browse repo in browser |
| `<leader>lGH` | Lazygit file history   |
| `<leader>lGL` | Lazygit repository log |

---

## 🗒️ Obsidian Keybinds

| Keybind      | Action                                     |
| ------------ | ------------------------------------------ |
| `<leader>wn` | Open Today's Note                          |
| `<leader>wp` | Create New Note (Choose Personal/School)   |
| `<leader>wf` | Follow Wiki Link                           |
| `<leader>wb` | Show Backlinks                             |
| `<leader>ws` | Search Notes in Wiki                       |
| `<leader>wc` | Create/Link to Note                        |
| `<leader>wC` | Create/Link to Note (simple)               |
| `<leader>wL` | Insert Link to Existing Note (Telescope)   |
| `<leader>wE` | Create Essay Note (Choose Personal/School) |

---

## 📂 File Operations

| Keybind      | Action        |
| ------------ | ------------- |
| `<leader>wq` | Save and quit |
| `<leader>qq` | Force quit    |
| `<leader>ww` | Save file     |
| `gx`         | Open URL      |

---

## 🪟 Window Management

| Keybind      | Action            |
| ------------ | ----------------- |
| `<leader>sv` | Vertical split    |
| `<leader>sh` | Horizontal split  |
| `<leader>se` | Equal size splits |
| `<leader>sx` | Close split       |
| `<leader>sk` | Increase height   |
| `<leader>sl` | Increase width    |
| `<leader>sw` | Decrease width    |

---

## 📋 Clipboard Operations

| Keybind     | Action                          |
| ----------- | ------------------------------- |
| `<leader>y` | Yank to system clipboard        |
| `<leader>Y` | Yank line to system clipboard   |
| `<leader>d` | Delete to system clipboard      |
| `<leader>D` | Delete line to system clipboard |
| `<leader>p` | Paste from system clipboard     |
| `<leader>P` | Paste above from clipboard      |

---

## ⚙️ LSP Config (LSP + none-ls)

| Keybind      | Action              |
| ------------ | ------------------- |
| `<leader>ci` | Hover (Code info)   |
| `<leader>cd` | Go to definition    |
| `<leader>cr` | References          |
| `<leader>ca` | Code action         |
| `<leader>cn` | Next diagnostic     |
| `<leader>cp` | Previous diagnostic |
| `<leader>gf` | Smart Format File   |

---

## 🔭 Telescope

| Keybind      | Action                   |
| ------------ | ------------------------ |
| `<C-p>`      | Find files               |
| `<leader>fg` | Live grep                |
| `<leader>fs` | Find School Files        |
| `<leader>fz` | Zoxide search            |
| `<leader>fp` | Project Switcher         |
| `<C-e>`      | Noice (Telescope)        |
| `<leader>fy` | Yank history (Telescope) |

---

## 🔍 Spectre (Search & Replace)

| Keybind             | Action                           |
| ------------------- | -------------------------------- |
| `<leader>sf`        | Search & Replace in Current File |
| `<leader>sb`        | Search & Replace in Open Buffers |
| `:CleanSpectreJunk` | Cleanup Spectre backup files     |

---

## ❗ Trouble (Diagnostics and Lists)

| Keybind      | Action                     |
| ------------ | -------------------------- |
| `<leader>xx` | Diagnostics (All)          |
| `<leader>xX` | Buffer Diagnostics         |
| `<leader>cs` | Symbols                    |
| `<leader>cl` | LSP Definitions/References |
| `<leader>xL` | Location List              |
| `<leader>xQ` | Quickfix List              |

---

## ⚓ Harpoon

| Keybind      | Action               |
| ------------ | -------------------- |
| `<leader>ha` | Add file / Open Menu |
| `<leader>hd` | Remove Current File  |
| `<leader>hh` | Open Harpoon Menu    |
| `<leader>h1` | Go to File 1         |
| `<leader>h2` | Go to File 2         |
| `<leader>h3` | Go to File 3         |
| `<leader>h4` | Go to File 4         |

---

## 🐞 Debugging (DAP)

| Keybind      | Action                 |
| ------------ | ---------------------- |
| `<leader>bb` | Toggle breakpoint      |
| `<leader>bc` | Conditional breakpoint |
| `<leader>bl` | Logpoint               |
| `<leader>br` | Clear breakpoints      |
| `<leader>ba` | List breakpoints       |
| `<leader>dc` | Continue               |
| `<leader>dj` | Step over              |
| `<leader>dk` | Step into              |
| `<leader>do` | Step out               |
| `<leader>dd` | Disconnect Debug       |
| `<leader>dt` | Terminate Debug        |
| `<leader>dr` | Toggle REPL            |
| `<leader>dl` | Run Last               |
| `<leader>di` | Inspect Value          |
| `<leader>d?` | Show Scopes            |
| `<leader>df` | Telescope Frames       |
| `<leader>dh` | Telescope Commands     |
| `<leader>e`  | Show Diagnostics Float |

---

## 📑 Bufferline

| Keybind      | Action               |
| ------------ | -------------------- |
| `<leader>q`  | Close buffer         |
| `<leader>bn` | Next buffer          |
| `<leader>bm` | Previous buffer      |
| `<leader>bp` | Pin buffer           |
| `<leader>bx` | Delete other buffers |
| `<leader>bd` | Delete buffer        |

---

## 🧪 Testing (Java)

| Keybind      | Action             |
| ------------ | ------------------ |
| `<leader>tc` | Test class (Java)  |
| `<leader>tm` | Test method (Java) |

---

## 🖥️ ToggleTerm (Floating Terminal)

| Keybind      | Action               |
| ------------ | -------------------- |
| `<leader>tt` | Floating terminal    |
| `<leader>th` | Horizontal terminal  |
| `<leader>tv` | Vertical terminal    |
| `<C-t>`      | Escape terminal mode |

---

## 🔄 Substitute

| Keybind     | Action                  |
| ----------- | ----------------------- |
| `s`         | Substitute operator     |
| `ss`        | Substitute line         |
| `S`         | Substitute to EOL       |
| `v mode: s` | Substitute visual range |

---

## 📓 Miscellaneous

| Keybind      | Action      |
| ------------ | ----------- |
| `<leader>td` | Open Dooing |
