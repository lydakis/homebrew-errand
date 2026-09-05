# Homebrew tap for Errand

[Errand](https://github.com/lydakis/errand) runs commands on machines you own.

This tap is prepared for the first stable release. No formula is published yet.
You can add the tap now:

```sh
brew tap lydakis/errand
```

After the first stable release and formula update:

```sh
brew install lydakis/errand/errand
```

## Maintainers

The publication integration belongs in the Errand repository. Its Homebrew
workflow runs when a stable GitHub release is published, verifies the generated
`errand.rb` and source checksum, validates a source installation, then updates
`Formula/errand.rb` here.

Set `GORELEASER_TOKEN` in Errand's Actions secrets with Contents write access to
this repository. `HOMEBREW_TAP_GITHUB_TOKEN` is accepted as a fallback, matching
the existing IceVault release setup.

Tags and draft or prerelease releases do not publish a formula. There is no
scheduled polling. The workflow can be rerun manually for an already published
stable release; it will not downgrade the tap or overwrite a changed same-version
formula.

The formula builds from source with Go. On machines that should receive jobs,
run `errand setup` after installing or upgrading. The tap does not manage the
runner through `brew services`.
