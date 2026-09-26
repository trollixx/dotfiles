# Agent instructions

@README.md describes the layout, rules, and workflow. Everything in it applies to you. This file adds rules for agents only.

- **Ask before changing the machine or the remote.** `chezmoi apply`, `chezmoi update`, running scripts, and `git push` all need the user's explicit approval. Show `chezmoi diff` first.
- **Commits need the user's review.** Show the diff and the proposed message, and commit only after approval. The same applies to amends, rebases, and fixups.
- **One tool or concern per commit.** If a change affects something README.md describes, update README.md in the same commit.
- **Commit messages are a subject line only:** the tool as a prefix (`git:`, `wt:`, `tc:`, `pwsh:`, `chore:`, `docs:`), then the imperative mood (`git: add …`, not `git: added …` or a noun phrase). No body.
- **No attribution.** Commit messages and PR descriptions get no `Co-Authored-By` trailers, session links, or "Generated with" footers.
- **Verify with read-only commands:** `chezmoi diff`, `chezmoi cat <target>`, `chezmoi managed`, and `chezmoi execute-template '<template>'`. Never edit a target file to test something.
