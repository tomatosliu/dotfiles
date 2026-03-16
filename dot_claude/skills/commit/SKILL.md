---
name: commit
description: Create a well-structured Git commit with conventional commit format. Use when the user wants to commit code changes.
disable-model-invocation: true
allowed-tools: Bash(git *),Bash(gh *)
argument-hint: [optional commit message hint]
---

## Pre-flight Checks

Before doing anything, run these checks **in order**:

### 1. Check if current directory is a Git repo

```bash
git rev-parse --is-inside-work-tree
```

If this fails, **STOP** and tell the user:

> This directory is not a Git repository. Run `git init` to initialize one, or `cd` into an existing repo.

### 2. Check if a Git remote is configured

```bash
git remote -v
```

If no remote is configured, **STOP** and tell the user:

> No Git remote configured. Add one with:
> ```
> git remote add origin <your-repo-url>
> ```

### 3. Check for changes

Run `git status` (never use `-uall` flag). If there are no staged or unstaged changes, tell the user there's nothing to commit.

---

## Commit Process

1. Run `git status` and `git diff` (staged + unstaged) to understand all changes
2. Run `git log --oneline -5` to see recent commit style for consistency
3. Analyze the changes and draft a commit message

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
```

- **type**: feat | fix | docs | style | refactor | perf | test | chore | build | ci
- **scope**: (optional) affected area, e.g. auth, api, ui
- **subject**: imperative mood, lowercase, no period, max 50 chars
- **body**: (optional) explain *why*, not *what*. Wrap at 72 chars.

### Rules

- If user provided $ARGUMENTS, use it as guidance for the commit message
- Stage relevant files by name — do NOT use `git add -A` or `git add .`
- Do NOT stage files that look like secrets (.env, credentials, tokens)
- Always use HEREDOC format for commit message to preserve formatting
- Do NOT push unless the user explicitly asks
- If pre-commit hook fails, fix the issue, re-stage, and create a NEW commit (never --amend)
- Show the final `git log --oneline -1` to confirm success
