# 📝 notes-cli

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
git clone https://github.com/yourname/notes-cli
cd notes-cli
chmod +x notes.sh
sudo ln -s $PWD/notes.sh /usr/local/bin/notes
```

Now you can run notes from anywhere 🎉

### Or One‑Line Install (Unix)

```bash
curl -sSL https://raw.githubusercontent.com/yourname/notes-cli/main/notes.sh \
  -o /usr/local/bin/notes && chmod +x /usr/local/bin/notes
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
notes new "Daily Reflection"
```

👉 Opens picker for folder → creates 202509171230-Daily-Reflection.md with YAML frontmatter.

### Open an existing note

```bash
notes open
```

👉 Interactive fuzzy search of notes with preview window.

### Search notes
```bash
notes search keyword
```

👉 Uses ripgrep to find matches inside all .md notes.

## 📂 Example Note Structure

~/.dropbox/Dropbox/Applicazioni/zettlr/
└── Projects/
    ├── 202509171230-Daily-Reflection.md
    └── 202509171450-Project-Idea.md

## 🤝 Contributing

PRs welcome! If you’ve got improvements, bug fixes, or ideas, just:

- Fork the repo
- Create a branch feature/my-cool-update
- Open a Pull Request 🚀

## 📜 License

This project is licensed under the terms of the [GNU General Public License v3.0](https://apps.abacus.ai/chatllm/LICENSE).
You are free to run, study, share, and modify the software — but any derivative works must also remain open under GPLv3.
