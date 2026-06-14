---
name: improve
description: Pick one config file in this repo and apply a single, tightly scoped improvement.
license: MIT
metadata:
  author: zerdaks
  version: "1.0"
---

Pick one config file in this repo and apply a single, tightly scoped improvement. The change may span multiple files when necessary (e.g. a rename or reorganization), but must address one coherent issue.

## Steps

### 1. Pick a target file

Run:
```bash
find .config/fish .config/nvim .config/lazygit \
  .tmux.conf .wezterm.lua .gitconfig .irbrc \
  -type f ! -name 'lazy-lock.json' ! -path '*/spell/*' \
  | xargs ls -lt 2>/dev/null | awk 'NR>1 {print $NF}' | tail -5
```

This lists the five least-recently-modified eligible config files. Read each one and pick the file with the most clear improvement opportunity.

### 2. Review and improve

Read the chosen file carefully. Apply the first improvement you find from this priority list:

1. Correctness issues (wrong flags, broken syntax, deprecated options)
2. Missing options that improve UX/DX (e.g. a useful keybind, a sensible default)
3. Non-idiomatic patterns (e.g. verbose fish constructs with a shorter form, redundant Lua boilerplate)
4. Clarity or organization (grouping related settings, removing stale comments)
5. Simplification or dead code (unused aliases, duplicate config keys)

Constraints:
- Keep the change tightly scoped to a single coherent improvement
- Do not touch `lazy-lock.json`, spell files, or files outside the paths above
