---
name: stow-add
description: Scaffold and stow a new dotfile package. Usage: /stow-add <package-name>
disable-model-invocation: true
---

Given a package name argument (e.g. `zsh`, `kitty`, `git`):

1. Determine the appropriate config path:
   - For most tools: `$PACKAGE/.config/$PACKAGE/`
   - For git: `git/.config/git/`
   - For zsh: `zsh/` (home-dir dotfiles like `.zshrc`)

2. Create the directory structure under `~/dotfiles/$PACKAGE/`.

3. Add a placeholder config file appropriate for the tool.

4. Update `install.sh` — add `$PACKAGE` to the stow loop if not already present.

5. Run:
   ```bash
   stow --dir=~/dotfiles --restow $PACKAGE
   ```

6. Confirm symlinks were created successfully with `ls -la` of the target path.
