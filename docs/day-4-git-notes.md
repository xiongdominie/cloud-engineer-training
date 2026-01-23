# Day 4 – Git Fundamentals (Plain‑English Notes)

## Big Idea

Git is a **version history system**. It does **not** auto‑save. It only remembers changes when **you commit**.

---

## Three Separate Things (Do Not Mix These Up)

1. **Editing a file** (VS Code)

   * You type and save normally.
   * This only saves to your computer.

2. **Tracking a file** (`git add` or VS Code + button)

   * Tells Git: *“Watch this file.”*
   * Tracking ≠ saving history.

3. **Saving history** (`git commit` or VS Code ✔ Commit)

   * Takes a snapshot.
   * This is the **only** way Git remembers a version.

---

## The Always‑True Workflow

1. Edit (VS Code)
2. Add (stage the file)
3. Commit (save a snapshot)

> If you skip **commit**, Git remembers nothing.

---

## Terminal Commands (What They Mean)

* `pwd` → Where am I?
* `ls` → What files are here?
* `cd foldername` → Go into a folder
* `git status` → What does Git see?
* `git add filename` → Track / stage a file
* `git commit -m "message"` → Save a snapshot

---

## VS Code Equivalents

* See changes → Source Control panel
* Track file → Click **+**
* Commit → Type message + click **✔ Commit**

Same actions. Different interface.

---

## Key Rules to Remember

* Git never auto‑saves history.
* Every important change needs a commit.
* You can open a repo many times; commits only happen when **you choose**.
* Terminal and VS Code both talk to the **same Git system**.

---

## One‑Sentence Rule

> **If you want Git to remember it, you must commit it.**
