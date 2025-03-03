# Obsidian.nvim Keybinds and Workflow Documentation

## Overview

This document explains the keybinds and workflows used to manage personal notes, school notes, and essays within a Neovim configuration using Obsidian.nvim. This setup is tailored to work with a directory structure located at `~/Desktop/wiki`, and it leverages templates to standardize note creation.

---

## Directory Structure

This configuration expects the following directory layout:

```
~/Desktop/wiki/
├── personal/             # For general personal notes
├── school/
│   ├── Y3S1/             # Year 3 Semester 1 notes
│       ├── class1/       # Notes for each class (move manually after creation)
│       └── class2/
├── templates/            # Contains all templates
│       ├── note.md       # Standard note template
│       ├── simplelink.md # Simple template for linked notes
│       ├── notelink.md   # Full template for linked notes
│       └── essay.md      # Template for essays
```

---

## Keybinds

### Daily Note

- `<leader>wn` — Open today's daily note (uses Obsidian.nvim's built-in `ObsidianToday`)

### Create New Note (Picker)

- `<leader>wp` — Prompts to save note in either:
  - `personal`
  - `Y3S1`

Uses the `note.md` template.

### Follow Link

- `<leader>wf` — Follow `[[wikilink]]` under cursor.

### Backlinks

- `<leader>wb` — Show all backlinks to the current note.

### Search Notes (Excluding Templates and Git)

- `<leader>ws` — Search all notes using Telescope, but excludes:
  - `.git/`
  - `templates/`

### Create/Link Note (Backlinked)

- `<leader>wc` — Prompts for note title and creates/links to a note (full template) in the current directory.
- `<leader>wC` — Same as above, but uses the `simplelink.md` template.

### Insert Link to Existing Note

- `<leader>wL` — Opens Telescope to select an existing note to link to.

### Create New Essay (Picker)

- `<leader>wE` — Prompts to save essay in either:
  - `personal`
  - `Y3S1`

Uses the `essay.md` template.

---

## Templates Overview

Templates are stored inside `~/Desktop/wiki/templates/`.

- `note.md` — Standard note (for standalone notes)
- `simplelink.md` — Linked note with basic structure
- `notelink.md` — Linked note with backlink header
- `essay.md` — Structure for essays

---

## Adapting This Configuration to Your Setup

### Changing the Base Directory

If your notes live somewhere else, update all instances of:

```lua
~/Desktop/wiki
```

to your desired root (for example, `~/Documents/notes`).

### Updating School Structure

If you want different semesters or levels (e.g., Y4S2), simply change:

```lua
~/Desktop/wiki/school/Y3S1
```

to your own semester.

### Adding More Categories

You can extend the picker commands (like `<leader>wp` and `<leader>wE`) to include additional categories like `work`, `projects`, etc.

### Adding/Modifying Templates

If you want to create templates for other types (e.g., meeting notes), just add more templates to `~/Desktop/wiki/templates/` and modify `create_note_in_folder()` to support them.

---

## Important Workflow Notes

- After creating a note in `Y3S1`, move it manually into the correct class folder (`math101`, `cs202`, etc.).
- Linked notes (created via `<leader>wc` or `<leader>wC`) are placed in the same directory as the current note.
- Essays and regular notes use the same picker to select `personal` vs `Y3S1`.
- Templates automatically populate the `{{title}}` and `{{date}}` placeholders.

---

## Summary Table

| Keybind      | Action                                            |
| ------------ | ------------------------------------------------- |
| `<leader>wn` | Open today's note                                 |
| `<leader>wp` | Create new note (picker)                          |
| `<leader>wf` | Follow link under cursor                          |
| `<leader>wb` | Show backlinks                                    |
| `<leader>ws` | Search notes (excluding templates/.git)           |
| `<leader>wc` | Create/link note in current dir (full template)   |
| `<leader>wC` | Create/link note in current dir (simple template) |
| `<leader>wL` | Insert link to existing note                      |
| `<leader>wE` | Create new essay (picker)                         |
