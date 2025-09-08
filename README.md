# Ibrahim-Refaay.github.io

Personal GitHub Pages website for Ibrahim Refaay.

## 🚨 Git Troubleshooting Resources

Having trouble pushing to Git? Check out these helpful resources:

- **[Quick Git Fix Guide](QUICK-GIT-FIX.md)** - Fast solutions for common Git permission errors
- **[Complete Git Troubleshooting Guide](GIT-TROUBLESHOOTING.md)** - Comprehensive guide for all Git authentication issues
- **[Git Diagnostic Script](git-diagnostic.sh)** - Run `./git-diagnostic.sh` to diagnose your Git configuration

### Common Issues Solved:
- ✅ Permission denied errors (403 Forbidden)
- ✅ Username mismatch problems
- ✅ Authentication setup (SSH keys, Personal Access Tokens)
- ✅ Repository access issues

**Quick Fix for Permission Errors:**
```bash
# 1. Fix username
git config --global user.name "Ibrahim-Refaay"

# 2. Use Personal Access Token when pushing
git push -u origin main
# Username: Ibrahim-Refaay
# Password: [Your GitHub Personal Access Token]
```