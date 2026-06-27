---
name: commit
description: Stage all changes and create a Git commit using the Commitizen / Conventional Commits structure (type(scope): subject). Use whenever the user wants to commit, "make a commit", "commit my changes", "commit this", or asks for a conventional/commitizen-style commit. If there is nothing to commit, say so and stop.
---

Stage all changes and commit with a concise message in the Commitizen (Conventional Commits) format.

**Steps**

1. **Check for changes**

   Run:
   ```bash
   git status --porcelain
   ```
   If the output is empty, tell the user there is nothing to commit and stop. Don't stage, don't commit.

2. **Warn about sensitive files**

   Scan the `git status --porcelain` output for files matching patterns like
   `.env`, `*.pem`, `*.key`, `*.p12`, `*secret*`, `*credential*`, `*password*`, `*token*`.

   If any match, list them so the user knows what is about to be committed. This is a heads-up, not a gate - proceed unless the user has told you otherwise.

3. **Stage everything**

   ```bash
   git add -A
   ```

4. **Read the diff**

   ```bash
   git diff --staged
   ```
   Understand what changed and why so the message reflects intent, not just file names.

5. **Write a Commitizen message**

   Format: `type(scope): subject`

   - **type** (required): one of `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.
   - **scope** (optional): a lowercase noun for the area touched, e.g. `(fish)`, `(nvim)`, `(claude)`. Drop it if the change is broad or no clear scope fits - a missing scope is better than a vague one.
   - **subject** (required): imperative mood ("add", not "added"/"adds"), lowercase first word, no trailing period.

   Use only ASCII characters in the message - no smart quotes, em dashes, or emoji. Stick to plain `'`, `"`, `-`, and standard ASCII punctuation.

   Keep it concise - aim for a subject under ~50 characters that captures the *what* and *why*, not the *how*. Most commits are a single line. Only add a body (blank line, then prose) when the reasoning genuinely won't fit in the subject; skip it otherwise.

   To choose a scope and confirm the convention in use, glance at recent history:
   ```bash
   git log --oneline -10
   ```

6. **Commit**

   ```bash
   git commit -m "<message>"
   ```
   Echo the raw output from `git commit` verbatim - show the exact hash and message, don't paraphrase or rewrite it.

**Examples**

Input: Pointed the psql alias at psql 18 instead of 17
Output: `fix(fish): point psql alias to psql-18`

Input: Added a new Neovim plugin for a colorscheme
Output: `feat(nvim): add colorscheme plugin`

Input: Reformatted several config files, no behavior change
Output: `style: reformat config files`

Input: Multiple unrelated tweaks across fish and the justfile
Output: `chore: fix fish/justfile bugs`
