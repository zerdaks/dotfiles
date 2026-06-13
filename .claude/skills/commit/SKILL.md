---
name: commit
description: Stage all changes and create a Git commit with an AI-generated message that matches the repo's existing commit style. Warns about sensitive files, then asks for confirmation before committing.
license: MIT
metadata:
  author: zerdaks
  version: "1.0"
---

Stage all changes and commit with a message that matches this repo's existing style.

**Steps**

1. **Check for changes**

   Run:
   ```bash
   git status --porcelain
   ```
   If the output is empty, tell the user there is nothing to commit and stop.

2. **Warn about sensitive files**

   Inspect the `git status --porcelain` output for files matching patterns like:
   `.env`, `*.pem`, `*.key`, `*.p12`, `*secret*`, `*credential*`, `*password*`, `*token*`

   If any match, list them and tell the user. Ask whether to continue or abort using **AskUserQuestion** before proceeding.

3. **Stage everything**

   Run:
   ```bash
   git add -A
   ```

4. **Read the diff**

   Run:
   ```bash
   git diff --staged
   ```
   Understand what changed: which files, what kind of change, and why (from context clues in the code).

5. **Inspect commit style**

   Run:
   ```bash
   git log --oneline -10
   ```
   Note the style: capitalization, tense, length, prefix conventions (e.g. `feat:`, `fix:`, `data backup:`, free-form). Match it.

6. **Generate a commit message**

   Write a concise commit message that:
   - Matches the tone, format, and length of existing commits
   - Follows any prefix convention present in the log
   - Describes what changed and why, not how

7. **Ask for confirmation**

   Use **AskUserQuestion** with a single question:
   - Question: "Commit with this message?"
   - Show the generated message clearly in the option label or description
   - Option 1: `Commit` — description shows the full generated message
   - Other: user types their own message

8. **Commit**

   Run:
   ```bash
   git commit -m "<confirmed or user-provided message>"
   ```
   Show the resulting commit hash and summary line.
