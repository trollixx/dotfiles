# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). One repository serves every machine:

- Windows desktops and laptops
- A Linux desktop
- WSL
- Work machines, which get nothing personal

## New machine

1. Install chezmoi:
   - Windows: install [Scoop](https://scoop.sh), then `scoop install chezmoi`
   - Linux: use the distribution's package manager, for example `sudo pacman -S chezmoi`
2. `chezmoi init --apply trollixx`

On a machine that already has its own configs, clone first and review before applying:

```sh
chezmoi init trollixx
chezmoi diff
chezmoi apply
```

## Layout

`.chezmoiroot` points chezmoi at `home/`, so only files under `home/` map to the home directory.

## Rules

- **The repository is public.** Nothing secret or personal goes in as plain text: no tokens, keys, work hostnames, or private paths. Per-machine values come from chezmoi config data. If secrets are ever needed, they come from a password manager at apply time.
- **Work machines clone the whole repository.** `.chezmoiignore` controls what gets applied, not what gets cloned, so ignoring a file doesn't hide it.

## Everyday use

| Task | Command |
|---|---|
| Open the source directory | `chezmoi cd` |
| Preview what `apply` would change | `chezmoi diff` |
| Apply | `chezmoi apply` |
| Pull and apply updates | `chezmoi update` |
| Copy a changed plain file back into the source | `chezmoi re-add <target>` |
| Edit a template or `modify_` file | `chezmoi edit <target>` |
| Reconcile a template with its changed target | `chezmoi merge <target>` |

Templates (`*.tmpl`) and `modify_` files can't be re-added. Edit the source instead.

Coding agents read [AGENTS.md](AGENTS.md). Start them from the source directory (`chezmoi cd`) so it loads.
