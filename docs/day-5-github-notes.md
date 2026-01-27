# Day 5 – GitHub Workflow & Mental Model

## Purpose of Day 5

Day 5 is about understanding **where my work lives** and **how it moves** from my computer to the internet in a professional way.

Before Day 5:

* My work lived only on my Mac
* No backup
* No visibility to others

After Day 5:

* My work is backed up on GitHub
* My progress is visible and professional
* I can prove real hands-on experience

---

## The Three Places My Work Lives

### 1. Working Files (VS Code / Finder)

* Where I write notes and edit files
* Changes are temporary until saved
* Mistakes are safe here

### 2. Git (Local History on My Mac)

* Created using `git commit`
* A **manual save / snapshot** of my work
* Includes what changed and why
* Still lives only on my computer

### 3. GitHub (Remote / Online)

* Created using `git push`
* Stores my Git history online
* Acts as backup, portfolio, and collaboration space

---

## Key Concept (Core Mental Model)

```
Working files  →  git commit  →  git push
```

* `git commit` = manually save work into Git’s local history
* `git push` = send that saved history to GitHub (remote)

---

## What GitHub Is (In Simple Terms)

* Not Git
* A remote home for Git repositories
* Like Google Drive + LinkedIn for engineers

---

## Why a Personal Access Token (PAT) Is Needed

* GitHub no longer allows password-based pushes
* A token replaces the password
* Tokens are safer, limited, and revocable
* macOS saves it once, so future pushes are easy

---

## Real Engineer Daily Workflow

1. Work in VS Code
2. Save files
3. Check status:

   ```bash
   git status
   ```
4. Commit meaningful progress:

   ```bash
   git add .
   git commit -m "clear message"
   ```
5. Push to GitHub:

   ```bash
   git push
   ```

---

## What I Learned on Day 5

* Git commit ≠ Git push
* GitHub is a remote copy, not magic
* My work now exists outside my computer
* I understand the professional workflow

---

## Day 5 Status

✅ Day 5 completed and understood

Next: **Day 6 – Linux Fundamentals for Cloud Engineers**
