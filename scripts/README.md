# Scripts for Syncing Upstream Issues

This directory contains scripts to create GitHub issues synced from the upstream `paulnasca/paulstretch_cpp` repository.

## Available Scripts

### 1. Bash Script (Using GitHub CLI)

**File:** `sync_upstream_issues.sh`

**Prerequisites:**
- GitHub CLI (`gh`) installed and authenticated
- Permissions to create issues in the `peternicholls/paulstretch_cpp` repository

**Usage:**
```bash
# Make sure you're authenticated with gh
gh auth login

# Run the script
./scripts/sync_upstream_issues.sh
```

### 2. Python Script (Using PyGithub)

**File:** `create_upstream_issues.py`

**Prerequisites:**
- Python 3.6+
- PyGithub library: `pip install PyGithub`
- GitHub Personal Access Token with `repo` scope

**Usage:**
```bash
# Install dependencies
pip install PyGithub

# Set your GitHub token
export GITHUB_TOKEN="your_github_personal_access_token_here"

# Run the script
python3 scripts/create_upstream_issues.py
```

**Creating a GitHub Personal Access Token:**
1. Go to https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Give it a descriptive name (e.g., "Sync Upstream Issues")
4. Select the `repo` scope
5. Click "Generate token"
6. Copy the token and use it as shown above

## What These Scripts Do

Both scripts create 16 GitHub issues in the `peternicholls/paulstretch_cpp` repository. Each issue is synced from the upstream `paulnasca/paulstretch_cpp` repository and includes:

- **Original Title:** The title from the upstream issue/PR
- **Upstream Link:** Direct link to the original issue or pull request
- **Original Author:** GitHub username of the person who created the upstream issue
- **Original Body:** The full description/body from the upstream issue

All issues are tagged with `[Synced from upstream]` prefix in the body to clearly indicate their origin.

## Issues Being Created

The scripts will create the following 16 issues:

1. Paulstretch segmentation fault (#18)
2. No return in a function expecting one... Triggers undefined behavior with GCC14 (PR #17)
3. Clear path to download (#16)
4. Mac Builds are unsigned (#15)
5. Multiple audio file support? (#14)
6. fix compatibility with mxml 3.0 (PR #12)
7. Feature request: Use frequency shift to generate binaural beats (#10)
8. PaulStretch to Homebrew Cask? (#9)
9. C make build system (PR #8)
10. ENH: Add flac reading and writing (PR #7)
11. Integration improvements (PR #6)
12. Update Control.cpp (typo) (PR #5)
13. Mac OS X version (#4)
14. ArchLinux build error (#3)
15. missing zlib linkage (#2)
16. First few seconds at any stretch have intense distortion (#1)

## Manual Creation

If you prefer to create issues manually, refer to `SYNC_UPSTREAM_ISSUES.md` in the repository root for the complete formatted content of each issue.

## Troubleshooting

### Bash Script Issues
- **Error: "gh: command not found"**
  - Install GitHub CLI: https://cli.github.com/
- **Error: "authentication required"**
  - Run `gh auth login` and follow the prompts

### Python Script Issues
- **Error: "ModuleNotFoundError: No module named 'github'"**
  - Run `pip install PyGithub`
- **Error: "GITHUB_TOKEN environment variable not set"**
  - Set the environment variable as shown above
- **Error: "Bad credentials"**
  - Ensure your token has the `repo` scope and is still valid

## Notes

- These scripts are idempotent-safe, meaning running them multiple times will create duplicate issues. Only run once unless you want duplicates.
- Issues are created with the current authenticated user/token as the creator
- The scripts preserve the original author information in the issue body
- Links to upstream issues/PRs are preserved for reference
