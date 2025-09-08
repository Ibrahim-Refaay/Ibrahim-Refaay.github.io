# Git Authentication Troubleshooting Guide

This guide helps you resolve common Git authentication issues, especially the "Permission denied" or "403 Forbidden" errors when pushing to GitHub repositories.

## Common Error: 403 Permission Denied

If you're seeing an error like:
```
remote: Permission to username/repository.git denied to differentusername.
fatal: unable to access 'https://github.com/username/repository.git/': The requested URL returned error: 403
```

## Quick Diagnosis

1. **Username Mismatch**: Check if your Git username matches your GitHub username exactly
2. **Authentication Method**: Ensure you're using the correct authentication (SSH keys or Personal Access Token)
3. **Repository Access**: Verify you have push access to the repository

## Solution 1: Fix Username Configuration

### Check Current Git Configuration
```bash
git config --global user.name
git config --global user.email
git config --list | grep user
```

### Update Git Username and Email
```bash
# Set your GitHub username (case-sensitive)
git config --global user.name "Your-GitHub-Username"
git config --global user.email "your-email@example.com"
```

**Important**: Make sure the username matches your GitHub account exactly, including hyphens and capitalization.

## Solution 2: Use Personal Access Token (Recommended)

### Step 1: Create Personal Access Token
1. Go to GitHub.com → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. Give it a descriptive name (e.g., "Local Development")
4. Select scopes: `repo` (for private repos) or `public_repo` (for public repos)
5. Click "Generate token"
6. **Important**: Copy the token immediately (you won't see it again)

### Step 2: Configure Git to Use Token
```bash
# Remove existing credential
git config --global --unset credential.helper

# Set up credential helper (Windows)
git config --global credential.helper manager-core

# Set up credential helper (macOS)
git config --global credential.helper osxkeychain

# Set up credential helper (Linux)
git config --global credential.helper store
```

### Step 3: Push with Token
When Git prompts for username and password:
- **Username**: Your GitHub username
- **Password**: Your Personal Access Token (not your GitHub password)

## Solution 3: Use SSH Keys (Advanced)

### Step 1: Generate SSH Key
```bash
# Generate new SSH key
ssh-keygen -t ed25519 -C "your-email@example.com"

# Or if your system doesn't support ed25519:
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
```

### Step 2: Add SSH Key to SSH Agent
```bash
# Start SSH agent
eval "$(ssh-agent -s)"

# Add SSH key to agent
ssh-add ~/.ssh/id_ed25519
```

### Step 3: Add SSH Key to GitHub
1. Copy your public key:
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
2. Go to GitHub.com → Settings → SSH and GPG keys → New SSH key
3. Paste your public key and save

### Step 4: Change Remote URL to SSH
```bash
# Check current remote
git remote -v

# Change to SSH URL
git remote set-url origin git@github.com:username/repository.git
```

## Solution 4: Repository-Specific Fixes

### For Repository Access Issues
```bash
# Clone with your username in URL
git clone https://your-username@github.com/owner/repository.git

# Or set upstream with your username
git remote set-url origin https://your-username@github.com/owner/repository.git
```

### For Branch Issues
```bash
# Check current branch
git branch

# Push to correct branch
git push -u origin main

# Or push to master if that's the default
git push -u origin master
```

## Common Troubleshooting Commands

### Reset Git Credentials
```bash
# Windows
git config --global --unset credential.helper
cmdkey /delete:target=git:https://github.com

# macOS
git config --global --unset credential.helper
git credential-osxkeychain erase

# Linux
git config --global --unset credential.helper
rm ~/.git-credentials
```

### Test Authentication
```bash
# Test SSH connection
ssh -T git@github.com

# Test HTTPS connection
git ls-remote https://github.com/username/repository.git
```

### Check Repository Permissions
1. Go to the repository on GitHub.com
2. Check if you're a collaborator or have push access
3. If it's your repository, ensure you're logged in with the correct account

## Step-by-Step Fix for Your Specific Error

Based on your error message, here's the specific fix:

1. **Check your GitHub username**:
   - Your error shows `IbrahimRefaay` but repository owner is `Ibrahim-Refaay`
   - Make sure you're using the correct account

2. **Update Git configuration**:
   ```bash
   git config --global user.name "Ibrahim-Refaay"
   git config --global user.email "your-actual-email@domain.com"
   ```

3. **Use Personal Access Token**:
   - Create a token with `repo` permissions
   - When pushing, use your GitHub username and the token as password

4. **Try pushing again**:
   ```bash
   git push -u origin main
   ```

## Additional Tips

- **Two-Factor Authentication**: If you have 2FA enabled, you must use a Personal Access Token or SSH keys
- **Organization Repositories**: Make sure you have push access to organization repositories
- **Case Sensitivity**: GitHub usernames are case-sensitive
- **Network Issues**: Sometimes VPN or corporate firewalls can cause issues

## Getting Help

If you're still having issues:
1. Check GitHub Status: https://status.github.com
2. Review GitHub's authentication documentation
3. Contact your repository administrator for access issues
4. Check if your account has been restricted

## Security Best Practices

- Never share your Personal Access Tokens
- Use tokens with minimal required permissions
- Regularly rotate your access tokens
- Use SSH keys for better security
- Keep your Git client updated