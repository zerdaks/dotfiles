# Proposals

Logged by /propose so it doesn't repeat itself. Change a status to accepted, rejected, or built.

- 2026-10-11 | built | Remove telescope-live-grep-args - delete the extension and its load_extension call from telescope.lua, since no keymap reaches it.
- 2026-10-11 | built | Stop brew-installing tools Mason already supplies - drop lua-language-server, stylua and shfmt from the justfile and uninstall the Homebrew copies, since nvim runs Mason's copies of all three.
- 2026-10-11 | built | Remove leap - delete leap.nvim and its s/S mappings, leaving the s keys to mini.surround.
- 2026-10-11 | built | Drop tpm and tmux-sensible - remove the tmux plugin manager and its only plugin, and set the five options and two key bindings it still contributes directly in .tmux.conf.
- 2026-10-11 | built | Replace bufferline with mini.tabline - remove bufferline.nvim and nvim-web-devicons and enable mini.tabline, which already ships in Kickstart's mini.nvim.
