# Action Required: Create Upstream Issues

This repository now has everything needed to sync 16 issues from the upstream `paulnasca/paulstretch_cpp` repository.

## Quick Start

Choose one of these methods to create the 16 issues:

### Option 1: Using GitHub CLI (Recommended)

```bash
# Authenticate with GitHub
gh auth login

# Run the script
./scripts/sync_upstream_issues.sh
```

### Option 2: Using Python Script

```bash
# Install dependencies
pip install PyGithub

# Set your GitHub token
export GITHUB_TOKEN="your_github_token_here"

# Run the script
python3 scripts/create_upstream_issues.py
```

### Option 3: Manual Creation

See `SYNC_UPSTREAM_ISSUES.md` for the complete formatted content of all 16 issues to create manually via GitHub web interface.

## What Will Be Created

16 GitHub issues synced from `paulnasca/paulstretch_cpp`, each including:
- Original title
- Link to upstream issue/PR
- Original author attribution
- Complete original description

## Files Added

- `SYNC_UPSTREAM_ISSUES.md` - Complete issue content for manual reference
- `scripts/sync_upstream_issues.sh` - Bash script using GitHub CLI
- `scripts/create_upstream_issues.py` - Python script using PyGithub
- `scripts/README.md` - Detailed usage instructions

## Why Wasn't This Done Automatically?

The automated tools in the development environment don't have GitHub credentials to create issues. The scripts and documentation have been prepared so that anyone with appropriate GitHub access can easily create these issues.

---

**Next Step:** Run one of the scripts above to create the 16 upstream issues.
