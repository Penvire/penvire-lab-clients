{ pkgs, ... }:
let
  # Same rule as the Conventional Commits check in Penvire/.github.
  conventionalCommit = pkgs.writeShellApplication {
    name = "conventional-commit";
    text = ''
      subject=$(head -n 1 "$1")
      case $subject in
        "Merge "* | "Revert "* | "fixup! "* | "squash! "* | "amend! "*) exit 0 ;;
      esac
      pattern='^(build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test)(\([[:alnum:]._/-]+\))?!?: [^[:space:]].*$'
      if [[ ! "$subject" =~ $pattern ]]; then
        echo "Not a Conventional Commit: $subject" >&2
        echo "Use 'type(scope): description', e.g. 'feat(identity): add token exchange'." >&2
        echo "Types: build chore ci docs feat fix perf refactor revert style test." >&2
        exit 1
      fi
    '';
  };
in
{
  languages.javascript = {
    enable = true;
    package = pkgs.nodejs_24;
    pnpm.enable = true;
  };

  # Android SDK and iOS tooling are added with the first mobile app.

  git-hooks.hooks = {
    conventional-commit = {
      enable = true;
      name = "Conventional Commits";
      entry = "${conventionalCommit}/bin/conventional-commit";
      stages = [ "commit-msg" ];
    };
    actionlint.enable = true;
  };
}
