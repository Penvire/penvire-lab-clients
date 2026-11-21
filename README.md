# Penvire Lab clients

> **Penvire Lab** is a learning project. It never runs in production and never holds real data. Lab and product share no code.

**Status:** not started yet.

User-facing apps for Penvire Lab. The web and desktop apps sign in through the lab BFF; the iOS and Android apps sign in with Identity and call the public API directly ([ADR 0002](https://github.com/Penvire/penvire-lab-backend/blob/main/docs/adr/0002-client-access-through-bff-and-public-api.md)).

## What goes here

- `apps/web`: React web UI
- `apps/desktop`: Electron desktop app
- `apps/ios`: iOS app
- `apps/android`: Android app
- The shared theme package used by the apps and the lab's login pages (planned: `@penvire-lab/theme`)

## Related

- [penvire-lab-contracts](https://github.com/Penvire/penvire-lab-contracts): API client packages
- [penvire-lab-backend](https://github.com/Penvire/penvire-lab-backend): services and lab documentation

## License

[AGPL-3.0](LICENSE)

## Contributing

Commits must be signed and follow [Conventional Commits](https://www.conventionalcommits.org/). Pull requests are merged with a merge commit.

## Security

See the [Penvire security policy](https://github.com/Penvire/.github/blob/main/SECURITY.md).

Lab findings may be reported as public issues.
