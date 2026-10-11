---
name: improve
description: Survey this dotfiles repo and make one high-value, self-contained fix to what is broken, stale, or dead - an outright bug, a deprecated config idiom, a redundant setting, or a tool the config references but nothing installs. Use whenever the user asks to "improve my dotfiles", "clean up the configs", "tidy this up", "is anything broken here?", "anything stale in this repo?", or invokes /improve, without naming a specific file or change. The skill chooses what to fix, applies it, verifies the config still loads, and leaves it uncommitted for review. This is the correctness pass; when the question is whether a plugin or tool should be added, removed, or replaced, use `propose` instead.
---

# Improve

Pick the single highest-value fix you can find in this repo right now, make it well, prove it works, and hand it back uncommitted for the user to review. One run produces one focused, reviewable change - not a sweep.

This skill exists because "improve my dotfiles" is open-ended, and the temptation is to either do something trivial (reorder two aliases) or sprawl across the whole tree. Neither is useful. Dotfiles are personal and load-bearing: a "helpful" rewrite that changes behavior is worse than no change at all. The value is in *judgment* - surveying what's actually here and choosing the one fix a careful owner would make first.

## What "high-value" means here

You're optimizing for the change that most improves the repo per line touched. Good candidates, roughly in order of how often they pay off:

- **Bugs / correctness** - silently broken or wrong: bad paths, misspelled option names, syntax borrowed from the wrong tool (make's `$(HOME)` in a justfile), keymaps that shadow each other, options that no longer exist. These are worth the most.
- **Referenced but never installed** - config that names a binary nothing in this repo installs. See step 1a; this is the one kind of fault that survives every other kind of review, so it is the most likely to hold something real.
- **Deprecated / outdated idioms** - APIs the tools have moved past, options renamed across versions, settings in the wrong startup file.
- **Dead / redundant** - commented-out cruft, duplicated settings, modules nothing loads, redundant PATH edits. A personal file that overrides a vendored baseline is intentional, not a duplicate.

Lower value, usually skip: cosmetic reformatting (the formatter handles it), reordering or renaming for taste, and anything where the user might reasonably prefer their current style. Whether a tool belongs in the stack at all is `propose`'s question, not this skill's.

## The loop

### 1. Survey

Get oriented before you touch anything. Derive the map instead of trusting one written down here - a hardcoded list of files and tools goes stale the moment the tree moves, and a stale map is worse than no map:

```sh
git ls-files                    # the config; everything untracked is local state
just --list                     # the bootstrap path: what a fresh machine gets
git ls-files | grep -iE 'stylua|editorconfig|\.luarc'   # formatter/linter configs = the house style
grep -rniE 'kickstart|vendored|upstream' README.md .config | head   # files copied from upstream
```

Also work out how files reach `$HOME` (symlinked by stow or similar, copied, or used in place), since that decides which tracked files are live.

Read comments before judging the code beside them. This repo records its deliberate oddities in place - a comment explaining why something looks wrong turns a candidate into a non-candidate.

Prefer checks that execute the config over checks that read it, because they catch errors reading misses. Run each tool (`<tool> --version`) rather than trusting `command -v` - a shim whose interpreter is gone still resolves as present:

```sh
zsh -n <file>                       # shell syntax
just --fmt --check --unstable       # justfile
nvim --headless +qa                 # editor config loads without error
stylua --check <dir>                # only if stylua runs; otherwise read against its config
```

Don't install a missing tool unprompted, and don't skip a file because its tool is missing - read it by eye instead.

Don't over-survey. A few minutes is enough to spot something real. If two or three candidates compete, pick the one with the best value-per-line and note the others in your final summary - you're allowed to mention them, just not to do them all.

### 1a. Check that referenced tools actually exist

Config that names a binary is the one thing you cannot verify by reading. A formatter mapping can be valid, current, and well formatted - and completely inert because the binary isn't installed. Nothing in the file is wrong, so every other check walks past it.

Find referenced tools wherever config shells out: formatter and linter mappings, plugins that wrap a CLI, shell aliases and functions, terminal and multiplexer commands, git aliases and hooks. Then ask three separate questions, because they fail differently:

- **Is it on this machine now?** If not, that feature is dead *today* and the user probably doesn't know.
- **Would a fresh machine get it?** A tool can be on `$PATH` because it was installed by hand years ago. The repo is only self-installing if its bootstrap path brings it in - including any installer the editor or shell config runs itself.
- **Is the copy on `$PATH` the one the repo installs?** Resolve it (`ls -l "$(command -v <tool>)"`). This fails three ways, all of which look healthy: the package ships a differently named binary, an earlier `$PATH` entry shadows it, or a different package manager put it there.

```sh
for t in <tools you found>; do
  command -v "$t" >/dev/null || echo "MISSING: $t"
  grep -qw -- "$t" <bootstrap files> || echo "NOT INSTALLED BY REPO: $t"
done
```

Missing *and* uninstallable is broken now; present but uninstallable, or present from somewhere other than the bootstrap, is a trap that only bites on a new machine. The first outranks the second when you choose.

Check the bootstrap itself the same way: steps the top-level entry point never runs, and - where files are symlinked - tracked files that are neither linked nor deliberately ignored.

### 1b. Vendored files

Vendored files are off limits for restyling: don't reformat one or "modernize" its upstream idioms - that's upstream's style, not drift. But vendored does not mean unread. Diff it against upstream, because the divergences are the point: a handful of differing lines is normal, while a large diff means personal config has crept back in, and *that* is a candidate.

Upstream idioms often look wrong out of context. Check upstream before calling anything in or near a vendored file a bug.

### 2. Decide and state it

Before editing, say in one or two sentences what you're going to fix and *why it's worth doing*. This keeps you honest - if you can't articulate the value, it's probably not the right change. If nothing genuinely worthwhile turns up (it happens in a clean repo), say so rather than inventing busywork.

### 3. Apply it surgically

Make the change and nothing else. The test to hold yourself to: every changed line should trace directly to the fix you named. Don't "improve" adjacent config along the way, don't reformat untouched lines, match the surrounding style even where you'd personally do it differently. If your change orphans something - a PATH entry, an install line, a README mention - clean up that orphan, but only that.

Edit the repo, not the machine. Installing, uninstalling, or relinking on this machine is the user's call; if the fix needs it, name the recipe to run in the summary.

Don't touch `.claude/skills/**` unless asked - those are skills, not config to lint.

### 4. Verify

A change isn't done until you've proven it works. Rerun the step 1 checks against every file you touched, and where you can, exercise the thing itself: run the alias, trigger the keymap's command headlessly, dry-run the recipe (`just --dry-run <recipe>`).

For a bug, you should have watched the check fail before your change and pass after, so you know it's actually testing the thing. If verification fails, fix it before reporting; don't hand back a broken config.

Some changes can't be exercised from here - a recipe that would install software, a setting that only shows in an interactive terminal. Say in the summary what you could not run and how the user can check it, so the gap reads as a decision, not an oversight.

### 5. Review your own diff

Read `git diff` as if someone else wrote it and you're the reviewer. This pass is cheap and it is the one that saves a round trip:

- **Cut comments that argue.** A comment earns its place by saying something the config cannot: a non-obvious constraint, a surprising tool behavior, why the obvious form is wrong. *Why the change was worth making* goes in the summary, not the file.
- **Look for redundancy your change introduced** - a setting now made in two places, a PATH entry added twice, an install line that duplicates another recipe's.
- **Take the smallest form that keeps every behavior.** Shorter is better only while nothing is lost.

### 6. Report, uncommitted

Leave the changes in the working tree - **do not commit**. The user reviews before anything lands. End with a short summary:

- **What** you changed (the files, one line each)
- **Why** it was the highest-value pick
- **Verification** - what you ran and that it's clean, plus anything you could not run
- **Also noticed** (optional) - other candidates you deliberately left for a future run

Keep the summary tight. The diff tells most of the story; your job is to explain the judgment behind it.
