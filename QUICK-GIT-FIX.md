# Quick Git Fix Guide

## 🚨 Getting "Permission denied" error? Here's the quick fix:

### For the specific error you showed:
```
remote: Permission to Ibrahim-Refaay/Rahaty-dash.git denied to IbrahimRefaay.
```

**Problem**: Username mismatch - `IbrahimRefaay` vs `Ibrahim-Refaay`

### 🔧 Quick Fix Steps:

1. **Update your Git username**:
   ```bash
   git config --global user.name "Ibrahim-Refaay"
   ```

2. **Create a Personal Access Token**:
   - Go to GitHub.com → Settings → Developer settings → Personal access tokens
   - Generate new token with `repo` permissions
   - Copy the token

3. **Push with correct credentials**:
   ```bash
   git push -u origin main
   ```
   - Username: `Ibrahim-Refaay`
   - Password: [Your Personal Access Token]

### 🔑 Alternative: Use SSH (More Secure)

1. **Generate SSH key**:
   ```bash
   ssh-keygen -t ed25519 -C "your-email@example.com"
   ```

2. **Add to GitHub**:
   - Copy: `cat ~/.ssh/id_ed25519.pub`
   - Add to GitHub → Settings → SSH keys

3. **Change remote to SSH**:
   ```bash
   git remote set-url origin git@github.com:Ibrahim-Refaay/Rahaty-dash.git
   ```

### 📋 Checklist:
- [ ] Username matches exactly (case-sensitive)
- [ ] Using Personal Access Token or SSH key
- [ ] Have push access to repository
- [ ] Pushing to correct branch (main/master)

**Need more help?** See the full [Git Troubleshooting Guide](GIT-TROUBLESHOOTING.md)