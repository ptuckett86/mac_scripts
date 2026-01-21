#!/bin/bash

# Development Environment Setup Script
# This script installs Oh My Zsh, Docker, NVM, and sets up SSH keys

set -e  # Exit on error

echo "=========================================="
echo "Development Environment Setup"
echo "=========================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_section() {
    echo -e "${GREEN}[*]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# ==========================================
# Oh My Zsh Installation
# ==========================================
print_section "Installing Oh My Zsh..."

sudo apt update && sudo apt install zsh git curl -y

# Install Oh My Zsh (this may be interactive)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "Oh My Zsh installed successfully!"
else
    echo "Oh My Zsh is already installed."
fi

# Change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    print_warning "Changing default shell to zsh. You may be prompted for your password."
    chsh -s $(which zsh)
    echo "Default shell changed to zsh. Please log out and log back in for changes to take effect."
else
    echo "Zsh is already your default shell."
fi

echo ""

# ==========================================
# Docker Installation
# ==========================================
print_section "Installing Docker..."

# Update package list
sudo apt-get update

# Install ca-certificates and curl (if not already installed)
sudo apt install ca-certificates curl -y

# Create directory for Docker keyrings
sudo install -m 0755 -d /etc/apt/keyrings

# Add Docker's official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Update package list again
sudo apt update

# Install Docker packages
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Add current user to docker group
sudo usermod -aG docker $USER

# Check Docker status
sudo systemctl status docker --no-pager || true

echo "Docker installed successfully!"
print_warning "You may need to log out and log back in for Docker group permissions to take effect."
echo ""

# ==========================================
# Cursor Installation
# ==========================================
print_section "Installing Cursor..."

# Check if Cursor is already installed
if command -v cursor &> /dev/null || dpkg -l | grep -q cursor; then
    echo "Cursor is already installed."
else
    # Check if .deb file exists in Downloads
    CURSOR_DEB=$(find ~/Downloads -name "cursor_*.deb" -type f 2>/dev/null | head -n 1)
    
    if [ -n "$CURSOR_DEB" ] && [ -f "$CURSOR_DEB" ]; then
        echo "Found Cursor .deb file: $CURSOR_DEB"
        sudo apt install "$CURSOR_DEB" -y
        echo "Cursor installed successfully from local file!"
    else
        print_warning "No Cursor .deb file found in ~/Downloads/"
        print_warning "Please download Cursor manually from https://cursor.sh"
        print_warning "Place the .deb file in ~/Downloads/ and re-run this script,"
        print_warning "or install manually with: sudo apt install ~/Downloads/cursor_*.deb"
    fi
fi

echo ""

# ==========================================
# NVM Installation
# ==========================================
print_section "Installing NVM (Node Version Manager)..."

# Install NVM
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    
    # Add NVM to .zshrc
    if ! grep -q 'export NVM_DIR="$HOME/.nvm"' ~/.zshrc; then
        echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
        echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.zshrc
        echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshrc
    fi
    
    # Load NVM in current session
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    # Verify NVM installation
    nvm -v
    
    # Install Node.js version 14.20.1
    print_section "Installing Node.js 14.20.1..."
    nvm install 14.20.1
    nvm use 14.20.1
    
    echo "NVM installed successfully!"
else
    echo "NVM is already installed."
fi

echo ""

# ==========================================
# SSH Key Generation
# ==========================================
print_section "Setting up SSH keys..."

# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Check if SSH key already exists
if [ ! -f ~/.ssh/id_ed25519 ]; then
    print_warning "Generating new SSH key. You will be prompted for a passphrase (optional)."
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
    
    echo ""
    echo "Your public SSH key:"
    cat ~/.ssh/id_ed25519.pub
    echo ""
    print_warning "Please save this public key if you need it for GitHub, GitLab, etc."
else
    echo "SSH key already exists at ~/.ssh/id_ed25519"
    echo "Your public SSH key:"
    cat ~/.ssh/id_ed25519.pub
    echo ""
fi

echo ""

# Setup Repos Directory
print_section "Setting up Repos directory..."
mkdir -p ~/Repos
echo "Repos directory setup successfully!"
echo ""

# ==========================================
# Completion
# ==========================================
echo "=========================================="
echo -e "${GREEN}Installation Complete!${NC}"
echo "=========================================="
echo ""
print_warning "IMPORTANT: Please log out and log back in (or restart) for all changes to take effect:"
echo "  - Default shell change to zsh"
echo "  - Docker group permissions"
echo "  - NVM availability in new terminal sessions"
echo ""
