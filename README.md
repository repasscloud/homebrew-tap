# RePass Cloud Homebrew Tap

Official Homebrew tap for software published by **RePass Cloud Pty Ltd**.

This repository provides Homebrew formulae and casks for installing RePass Cloud command-line tools and macOS applications.

## Installation

Add the RePass Cloud tap:

```bash
brew tap RePassCloud/tap
```

Once the tap has been added, available packages can be installed normally with Homebrew.

For example:

```bash
brew install cursdel
```

You can also install a package directly without manually adding the tap first:

```bash
brew install RePassCloud/tap/cursdel
```

## Available Packages

### Formulae

| Package | Command | Description |
|---|---|---|
| `cursdel` | `cursdel` | CurseDelete secure file deletion utility |

Additional RePass Cloud command-line applications will be added here as they become available.

### Casks

macOS desktop applications may also be distributed through this tap using Homebrew Casks.

When available, they can be installed with:

```bash
brew install --cask <application>
```

## Repository Structure

```text
homebrew-tap/
├── Formula/
│   ├── cursdel.rb
│   └── ...
├── Casks/
│   └── ...
├── .github/
│   └── workflows/
│       └── ...
└── README.md
```

### Formula

Homebrew formulae are stored under:

```text
Formula/
```

Formulae are primarily used for command-line applications.

Example:

```text
Formula/cursdel.rb
```

### Casks

Homebrew casks are stored under:

```text
Casks/
```

Casks are used for macOS applications distributed as application bundles, DMGs, PKGs, or similar desktop application formats.

## Updating

Homebrew automatically checks tapped repositories when updating.

To update Homebrew and all configured taps:

```bash
brew update
```

To upgrade an installed package:

```bash
brew upgrade cursdel
```

To reinstall a package:

```bash
brew reinstall cursdel
```

## Removing a Package

To uninstall a formula:

```bash
brew uninstall cursdel
```

To uninstall a cask:

```bash
brew uninstall --cask <application>
```

## Removing the Tap

To remove the RePass Cloud tap:

```bash
brew untap RePassCloud/tap
```

Removing the tap does not automatically uninstall packages that were previously installed from it.

## Package Releases

Formulae and casks in this repository reference official release artifacts published by the corresponding RePass Cloud project.

Release artifacts are expected to be:

- versioned
- cryptographically checksummed using SHA-256
- published through the project's official release process
- referenced by an immutable release version

Where platform-specific binaries are provided, separate artifacts may be used for Apple Silicon and Intel macOS systems.

For example:

```text
aarch64-apple-darwin
x86_64-apple-darwin
```

Homebrew selects the appropriate artifact for the current Mac.

## Verifying an Installation

Installed package information can be viewed with:

```bash
brew info cursdel
```

The installed binary location can be checked with:

```bash
which cursdel
```

For applications that expose version information:

```bash
cursdel --version
```

## Troubleshooting

First update Homebrew:

```bash
brew update
```

Then check the package:

```bash
brew info cursdel
```

If required, reinstall it:

```bash
brew reinstall cursdel
```

For tap-related issues:

```bash
brew untap RePassCloud/tap
brew tap RePassCloud/tap
```

Homebrew diagnostics can also be run with:

```bash
brew doctor
```

## For Maintainers

Each application should have its own formula or cask within this repository.

A command-line application normally uses:

```text
Formula/<package>.rb
```

A macOS desktop application normally uses:

```text
Casks/<package>.rb
```

When publishing a new version:

1. Publish the application release and its artifacts.
2. Confirm the release artifacts are downloadable.
3. Calculate or obtain the SHA-256 checksum for each artifact.
4. Update the corresponding formula or cask.
5. Test the package locally.
6. Run Homebrew style and audit checks.
7. Commit and push the updated package definition.

Useful checks include:

```bash
brew style Formula/cursdel.rb
brew audit --strict Formula/cursdel.rb
```

For a cask:

```bash
brew style Casks/<application>.rb
brew audit --cask --strict Casks/<application>.rb
```

A local formula can be tested before release with:

```bash
brew install --build-from-source ./Formula/cursdel.rb
```

After publishing, a clean install should also be tested using the tap:

```bash
brew uninstall cursdel
brew tap RePassCloud/tap
brew install cursdel
cursdel --version
```

## Automation

Package updates may be automated from each application's release pipeline.

A typical release workflow can:

1. create the application release
2. publish platform-specific artifacts
3. generate SHA-256 checksums
4. update the appropriate formula or cask in this repository
5. open or merge a pull request containing the version update
6. run Homebrew validation before publishing

The application repositories remain the source of truth for application code and release artifacts.

This repository is only the Homebrew distribution catalogue.

## Issues

For problems with an application itself, report the issue in that application's project repository.

For problems specifically related to a Homebrew formula, cask, installation, checksum, or package definition, open an issue against this tap repository.

When reporting a Homebrew issue, include:

```bash
brew --version
brew config
brew info <package>
```

and the full installation or upgrade error where applicable.

## Security

Do not report security vulnerabilities through a public GitHub issue.

Use the security reporting process defined by the affected RePass Cloud project.

## Licensing

Each application distributed through this tap retains its own licence.

The licence declared by a Homebrew formula or cask describes the licence of the application being distributed and does not imply that every application in this repository uses the same licence.

Formula and cask definitions in this repository are maintained solely to facilitate installation through Homebrew.

## About

This is the official Homebrew package repository for RePass Cloud software.

```bash
brew tap RePassCloud/tap
```
