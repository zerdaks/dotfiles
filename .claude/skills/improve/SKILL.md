---
name: improve
description: Review this dotfiles repo for improvements — formatting, deprecated/outdated config idioms, dead or redundant settings, and outright bugs — then apply the fixes you approve. Use this skill whenever the user wants to clean up, tidy, modernize, lint, audit, polish, or "improve the code" in their dotfiles (fish, Neovim Lua, tmux, wezterm, git, justfile), even if they don't name a specific file. Trigger on phrases like "improve my dotfiles", "clean up the configs", "any improvements here?", or "review this repo".
---

# Improve

Review the dotfiles repo, surface concrete improvements, and apply the ones the user approves. This is a **review-first** workflow: the user wants to see findings before anything changes, then green-light fixes.

## Why this shape

Dotfiles are personal and load-bearing — a "helpful" rewrite that changes behavior is worse than no change at all. So the job is to find real, defensible improvements and let the user decide. Bias toward fewer high-confidence findings over a long list of nitpicks. If a change is purely cosmetic and the user might reasonably prefer their current style, say so rather than asserting it's wrong.

## The stack

These are the file types you'll review and how to reason about each:

- **fish** (`.config/fish/config.fish`, `.config/fish/conf.d/*.fish`) — shell config and abbreviations/aliases.
- **Neovim Lua** (`.config/nvim/**/*.lua`) — editor config and lazy.nvim plugin specs. `stylua.toml` defines the format (2-space, single quotes, no call parens, 160 col).
- **tmux** (`.tmux.conf`), **wezterm** (`.wezterm.lua`), **git** (`.gitconfig`), **just** (`justfile`), plus small dotfiles (`.irbrc`, `.luarc.json`).

## Workflow

### 1. Detect tooling first

Some checks rely on external tools that may not be installed. Probe before relying on them, and fall back to manual reading when missing — never skip a file just because its linter isn't present.

```
command -v fish_indent stylua shellcheck luacheck gitleaks
```

- `fish_indent` is reliably available — use it for fish formatting and `fish -n <file>` for syntax.
- `stylua` may be missing. If present, use `stylua --check` against `.config/nvim/stylua.toml`. If absent, check formatting by eye against the stylua.toml rules; don't install it unprompted.

### 2. Review, grouped by what matters

Scan every config file. Sort findings into these buckets, because they carry very different stakes:

- **Bugs / correctness** — things that are silently broken or wrong: bad paths, misspelled option names, make-isms in the justfile (`$(HOME)` instead of `$HOME`), keymaps that shadow each other, options that no longer exist. These are the most valuable finds.
- **Deprecated / outdated idioms** — APIs the tools have moved past: e.g. Neovim's `vim.lsp.buf_get_clients` → `vim.lsp.get_clients`, `vim.tbl_islist` → `vim.islist`, `vim.highlight` → `vim.hl`; fish `set -x` where a scope flag is intended; tmux options renamed across versions. Explain what changed and why the new form is preferred.
- **Dead / redundant** — commented-out cruft, duplicated settings, plugins configured but never loaded, conflicting keymaps, redundant PATH edits.
- **Formatting** — what `fish_indent` / `stylua` would change. Group these together; they're low-stakes and bulk-applicable.

For each finding, give `file:line`, what it is, and the specific fix. Keep it scannable.

### 3. Present, then wait

Show the findings grouped by bucket (bugs first). Don't edit yet. End with a clear question like: "Which of these should I apply? (all / bugs only / pick by number / none)".

Respect the answer precisely — apply only what's approved. This is the whole point of the review-first shape; applying unapproved changes breaks the user's trust in the skill.

### 4. Apply and verify

After approval, make surgical edits — touch only the approved lines, match surrounding style. Then verify what you changed:

- fish files: `fish -n <file>` (syntax) and `fish_indent <file>` (clean format).
- Lua files: `stylua --check <file>` if available.
- Re-read each edit to confirm it's what you intended.

Report exactly what changed (file + one-line summary each) and the verification result. If a verification fails, say so and fix it — don't leave a half-applied change.

## Notes

- Don't touch `.claude/skills/**` content unless asked — those are skills, not config to lint.
- If the repo is clean and you find nothing worth changing, say that plainly. A short "looks good, here are two optional nits" is a fine outcome — don't manufacture findings to look busy.
