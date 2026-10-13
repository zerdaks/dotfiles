# Proposals

Logged by /propose so it doesn't repeat itself. Change a status to accepted, rejected, or built.

- 2026-10-13 | built | Drop the Copilot CLI recipe - remove the copilot recipe from the justfile and uninstall the copilot-cli cask, leaving nvim's Copilot completions (Mason's copilot-language-server) untouched.
- 2026-10-11 | built | Drop fnm for Homebrew's Node - remove fnm from the zsh recipe and its init line from .zshrc, and use the Node that Homebrew already installs as a dependency of czg, prettier and sql-formatter.
- 2026-10-11 | built | Drop the PostgreSQL recipe - remove the postgres recipe (postgresql@18, its background service, pgcli) from the justfile and its PATH entry from .zprofile, and stop the orphaned server still running on this machine.
- 2026-10-11 | built | Drop the standalone Lua toolchain - remove the lua recipe (lua, luarocks) from the justfile and the ~/.luarocks/bin PATH entry from .zprofile, since nvim runs its own LuaJIT and the only rocks ever installed stopped working when Homebrew moved Lua to 5.5.
- 2026-10-11 | built | Drop hs for fzf's Ctrl-R - remove the fzf_history_search function and its hs alias from .zshrc, since fzf's own Ctrl-R history widget is already loaded.
- 2026-10-11 | rejected | Replace telescope-undo with built-in Undotree - remove telescope-undo.nvim and point <leader>u at nvim's own :Undotree.
- 2026-10-11 | built | Remove telescope-live-grep-args - delete the extension and its load_extension call from telescope.lua, since no keymap reaches it.
- 2026-10-11 | built | Stop brew-installing tools Mason already supplies - drop lua-language-server, stylua and shfmt from the justfile and uninstall the Homebrew copies, since nvim runs Mason's copies of all three.
- 2026-10-11 | built | Remove leap - delete leap.nvim and its s/S mappings, leaving the s keys to mini.surround.
- 2026-10-11 | built | Drop tpm and tmux-sensible - remove the tmux plugin manager and its only plugin, and set the five options and two key bindings it still contributes directly in .tmux.conf.
- 2026-10-11 | built | Replace bufferline with mini.tabline - remove bufferline.nvim and nvim-web-devicons and enable mini.tabline, which already ships in Kickstart's mini.nvim.
