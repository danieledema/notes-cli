# 📝 Zettli

A tiny, fast, and hackable **command‑line note manager** built with `fzf` + `neovim` + `ripgrep`.  
Perfect for quick Markdown notes, Zettelkasten workflows, or just keeping thoughts organized.  

---

## ✨ Features

- 📂 Create new notes in any subfolder (with frontmatter & timestamp)  
- 🔎 Search across your notes with `ripgrep` (super fast!)  
- 📖 Browse and open notes interactively with `fzf` + `bat` previews  
- ⚡ Simple install, just one script  

---

## 🚀 Installation

### Clone & Symlink
```bash
git clone https://github.com/danieledema/zettli
cd zettli
chmod +x zettli.sh
sudo ln -s $PWD/zettli.sh /usr/local/bin/zettli
```

Now you can run notes from anywhere 🎉

### Or One‑Line Install (Unix)

```bash
curl -sSL https://raw.githubusercontent.com/danieledema/zettli/main/zettli.sh \
  -o /usr/local/bin/zettli && chmod +x /usr/local/bin/zettli
```

## 📦 Dependencies

Make sure you have these installed:

- fzf — fuzzy finder
- ripgrep (rg) — fast search
- bat — code/markdown preview
- nvim — editor (you can swap this easily for vim or $EDITOR)

## 🛠 Usage
### Create a new note

```bash
zettli new "Daily Reflection"
```

👉 Opens picker for folder → creates 202509171230-Daily-Reflection.md with YAML frontmatter.

### Open an existing note

```bash
zettli open
```

👉 Interactive fuzzy search of notes with preview window.

### Search notes
```bash
zettli search keyword
```

👉 Uses ripgrep to find matches inside all .md notes.

## 📂 Example Note Structure

~/.dropbox/Dropbox/Applicazioni/zettlr/
└── Projects/
    ├── 202509171230-Daily-Reflection.md
    └── 202509171450-Project-Idea.md

## ⚙️ Configuration

You can customize where your notes live and which editor is used.

**Environment variables:**
- `NOTES_DIR` — Base directory for notes (default: `~/zettli`)
- `NOTES_EDITOR` — Editor to launch (default: `$EDITOR` if set, otherwise `nvim`)

Example:
```bash
export NOTES_DIR="$HOME/Documents/Notes"
export NOTES_EDITOR="vim"
```

## 🤝 Contributing

PRs welcome! If you’ve got improvements, bug fixes, or ideas, just:

- Fork the repo
- Create a branch feature/my-cool-update
- Open a Pull Request 🚀

## 📜 License

This project is licensed under the terms of the [GNU General Public License v3.0](https://apps.abacus.ai/chatllm/LICENSE).
You are free to run, study, share, and modify the software — but any derivative works must also remain open under GPLv3.
