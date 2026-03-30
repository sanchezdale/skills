# Skills

This repository is the source of truth for my agent skills.

It is organized as a multi-skill bundle so the same pack can be installed with
the `skills` CLI or copied into an agent's local skills directory.

## Layout

```text
skills/
  <skill-name>/
    SKILL.md
scripts/
  install.sh
  verify.sh
bundle.yaml
```

## Included Skills

- `frontend-skill`
- `harness-instrument-repo`
- `harness-audit`
- `harness-plan`
- `harness-spec`
- `harness-validate`

## Install With `skills.sh`

Once this repo is pushed to GitHub, install all skills from the repo:

```bash
npx skills add sanchezdale/skills --all
```

List skills before installing:

```bash
npx skills add sanchezdale/skills --list
```

Install a single skill:

```bash
npx skills add sanchezdale/skills --skill harness-instrument-repo
```

Install to specific agents:

```bash
npx skills add sanchezdale/skills --all -a codex -a claude-code
```

The documented repository layout for multi-skill repos is `skills/<name>/SKILL.md`,
which this repository follows.

## Local Install Script

Install all skills by copying them into the default global Codex skills directory:

```bash
./scripts/install.sh
```

Install by symlink instead of copy:

```bash
./scripts/install.sh --symlink
```

Install to a custom destination:

```bash
./scripts/install.sh --dest /path/to/skills
```

Examples:

```bash
./scripts/install.sh --dest ~/.codex/skills
./scripts/install.sh --dest ~/.claude/skills
./scripts/install.sh --symlink --dest ~/.codex/skills
```

## Verify

Check that every `SKILL.md` in this repo has parseable YAML frontmatter and
that `bundle.yaml` matches the contents of `skills/`:

```bash
./scripts/verify.sh
```

## Compatibility

These skills are written to be broadly compatible across agent ecosystems that
support the shared `SKILL.md` format.

They are expected to work especially well with:

- Codex
- Claude Code
- any agent supported by the `skills` CLI that installs standard `SKILL.md`
  directories

## Notes

- This repo is intended to hold user-managed skills, not system-managed skills.
- `bundle.yaml` documents the pack contents for humans and future tooling.
- When changing a skill here, reinstall or resymlink it into your agent's
  global skills directory if you want the global copy updated immediately.
- The root repository is licensed under Apache 2.0. See [LICENSE](LICENSE).
