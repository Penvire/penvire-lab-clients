# Penvire Lab clients

User-facing apps of Penvire Lab: a React web UI, an Electron desktop app, an iOS app and an Android app, plus shared packages.

> Penvire Lab is a learning project. It never runs in production, never holds real data and shares no code with the product. Ideas move to the product only by reimplementation or a reviewed copy.

## Repository map

```text
apps/web/          React web UI
apps/desktop/      Electron app, reuses the web UI's React code
apps/ios/          Swift, Xcode project
apps/android/      Kotlin, Gradle
packages/ui/       React components shared by web and desktop
packages/theme/    design tokens, also exported for iOS and Android
```

## Development environment

Enter the environment with `devenv shell`, or run `direnv allow` once. It provides Node 24 and pnpm. Android SDK and iOS tooling are added with the first mobile app; iOS builds need macOS and Xcode. Always run tools through it.

Git hooks run automatically: a commit-msg hook rejects messages that are not Conventional Commits (the same rule as CI), and actionlint checks workflow files.

No workspace yet. Once `pnpm-workspace.yaml` exists: `pnpm install`, then `pnpm --filter <app> <script>`.

## Rules

- Never push to `main`. Create a branch (`feat/`, `fix/` or `chore/`), push it and open a pull request. The maintainer merges.
- Pull requests are squash-merged. The PR title becomes the commit on `main`, so it must be a Conventional Commit; mark breaking changes with `!`.
- Commits are GPG-signed; `main` rejects unsigned commits.
- PR body: a one-paragraph summary, then a `## Test plan` section.
- Releases are managed by release-please. Do not bump versions or edit `CHANGELOG.md` by hand.
- Everything starts at 0.x. Below 1.0.0, `feat` and `fix` bump the patch and a breaking change (`!`) bumps the minor, so a new minor always means breaking. Leaving 0.x is deliberate: a commit with a `Release-As: 1.0.0` footer (ADR 0001 in penvire-lab-backend).
- The PR title becomes the changelog entry. Keep one user-facing change per PR. If a PR contains several, list every `feat` and `fix` on its own line in the PR description, between `BEGIN_COMMIT_OVERRIDE` and `END_COMMIT_OVERRIDE`; release-please uses that block instead of the title.

## Agent docs

- [Issue tracker](docs/agents/issue-tracker.md): GitHub Issues for `Penvire/penvire-lab-clients`
- [Triage labels](docs/agents/triage-labels.md)
- [Domain docs](docs/agents/domain.md): where the glossary and ADRs live

## Related repositories

- `../contracts`: [penvire-lab-contracts](https://github.com/Penvire/penvire-lab-contracts)
- `../backend`: [penvire-lab-backend](https://github.com/Penvire/penvire-lab-backend), also the lab documentation
