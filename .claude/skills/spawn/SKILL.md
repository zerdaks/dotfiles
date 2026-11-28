---
name: spawn
description: Hand the work agreed in this conversation to a new Claude session in its own tmux window and git worktree of the current repo. Confirms the work with the user, then opens the window; the session implements it and nothing else. Use when the user invokes /spawn, or asks to "spawn a session", "farm this out", or similar.
---

# Spawn

Hand the work agreed in this conversation to a new Claude session.

```
spawn

1. check     tmux and the repo              not in tmux or not a repo → stop
2. collect   what was agreed                nothing → stop
3. confirm   it with the user               cancel → stop
4. start     a session
5. report    the window
```

**Steps**

1. If `$TMUX` is empty or `git rev-parse --show-toplevel` fails, say so and stop.

2. Collect the work you agreed to in this conversation, leaving out anything rejected or unanswered. If nothing is clearly agreed, say so and stop.

3. Show the repo and the work in a few lines, and ask with AskUserQuestion: Start or Cancel. On Cancel, stop.

4. Write a prompt with everything the session needs, since it sees none of this conversation: the work in full, with the decisions and files already settled, and that it does this work and nothing else. Save it to a file in the scratchpad, then run this, with a short name for the work that no worktree uses yet:

   ```
   tmux new-window -d -c "$PWD" 'claude --worktree <name> "$(cat <prompt file>)"'
   ```

5. Say the window opened, or give the error if it failed.
