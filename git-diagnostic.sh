#!/bin/bash

# Git Configuration Diagnostic Script
echo "🔍 Git Configuration Diagnostic Tool"
echo "====================================="
echo

# Check Git installation
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed or not in PATH"
    exit 1
fi

echo "✅ Git is installed: $(git --version)"
echo

# Check Git configuration
echo "📋 Current Git Configuration:"
echo "-----------------------------"
echo "User Name: $(git config --global user.name || echo 'Not set')"
echo "User Email: $(git config --global user.email || echo 'Not set')"
echo "Credential Helper: $(git config --global credential.helper || echo 'Not set')"
echo

# Check if in a Git repository
if git rev-parse --git-dir > /dev/null 2>&1; then
    echo "📁 Repository Information:"
    echo "-------------------------"
    echo "Current Branch: $(git branch --show-current)"
    echo "Remote URL: $(git remote get-url origin 2>/dev/null || echo 'No remote set')"
    echo "Repository Status: $(git status --porcelain | wc -l) files changed"
    echo
    
    # Check remote access
    echo "🌐 Testing Remote Access:"
    echo "------------------------"
    if git ls-remote origin > /dev/null 2>&1; then
        echo "✅ Can access remote repository"
    else
        echo "❌ Cannot access remote repository"
        echo "   This might be an authentication issue"
    fi
    echo
else
    echo "❌ Not in a Git repository"
    echo
fi

# Check SSH configuration
echo "🔑 SSH Configuration:"
echo "--------------------"
if [ -f ~/.ssh/id_rsa.pub ] || [ -f ~/.ssh/id_ed25519.pub ]; then
    echo "✅ SSH keys found:"
    ls -la ~/.ssh/*.pub 2>/dev/null || echo "No public keys found"
    
    echo
    echo "Testing SSH connection to GitHub:"
    ssh -T git@github.com 2>&1 | head -3
else
    echo "❌ No SSH keys found"
fi
echo

# Recommendations
echo "💡 Recommendations:"
echo "------------------"

if [ "$(git config --global user.name)" = "" ]; then
    echo "• Set your Git username: git config --global user.name 'Your-Username'"
fi

if [ "$(git config --global user.email)" = "" ]; then
    echo "• Set your Git email: git config --global user.email 'your-email@example.com'"
fi

if [ "$(git config --global credential.helper)" = "" ]; then
    echo "• Set up credential helper for easier authentication"
fi

if ! ssh -T git@github.com &> /dev/null; then
    echo "• Consider setting up SSH keys for secure authentication"
fi

echo
echo "📖 For detailed troubleshooting, see GIT-TROUBLESHOOTING.md"
echo "🚀 For quick fixes, see QUICK-GIT-FIX.md"