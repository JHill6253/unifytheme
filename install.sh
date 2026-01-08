#!/bin/sh
# install.sh - Install Global Terminal Colors

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

info() {
    printf "${BLUE}%s${NC}\n" "$1"
}

success() {
    printf "${GREEN}%s${NC}\n" "$1"
}

error() {
    printf "${RED}error:${NC} %s\n" "$1" >&2
    exit 1
}

# Determine script directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Installation paths
BIN_DIR="${HOME}/.local/bin"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/themes"
THEMES_DIR="$CONFIG_DIR/themes"

info "Installing unifytheme..."

# Create directories
mkdir -p "$BIN_DIR"
mkdir -p "$THEMES_DIR"
mkdir -p "$CONFIG_DIR/generated"

# Copy the unifytheme script
cp "$SCRIPT_DIR/bin/unifytheme" "$BIN_DIR/unifytheme"
chmod +x "$BIN_DIR/unifytheme"
info "Installed unifytheme CLI to $BIN_DIR/unifytheme"

# Copy bundled themes
if [ -d "$SCRIPT_DIR/themes" ]; then
    cp "$SCRIPT_DIR/themes"/*.sh "$THEMES_DIR/"
    info "Copied bundled themes to $THEMES_DIR/"
fi

# Check if ~/.local/bin is in PATH
case ":$PATH:" in
    *":$BIN_DIR:"*)
        # Already in PATH
        ;;
    *)
        echo ""
        printf "${RED}Warning:${NC} $BIN_DIR is not in your PATH.\n"
        echo "Add this to your shell profile (~/.bashrc, ~/.zshrc, etc.):"
        echo ""
        echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
        echo ""
        ;;
esac

success "Installation complete!"
echo ""
echo "Next steps:"
echo ""
echo "  1. Configure your terminals (do this first!):"
echo ""
echo "     Ghostty - Add to ~/.config/ghostty/config:"
echo "       config-file = $CONFIG_DIR/generated/ghostty.conf"
echo ""
echo "     tmux - Add to ~/.tmux.conf:"
echo "       source-file $CONFIG_DIR/generated/tmux.conf"
echo ""
echo "     Neovim - Add to ~/.config/nvim/init.lua:"
echo "       vim.cmd('colorscheme unifytheme')"
echo ""
echo "  2. Set a theme:"
echo "     unifytheme set gruvbox-dark"
echo ""
echo "  3. Reload your apps:"
echo "     Ghostty: Cmd+Shift+, (or Ctrl+Shift+,)"
echo "     tmux:    tmux source-file ~/.tmux.conf"
echo "     Neovim:  :colorscheme unifytheme"
echo ""
echo "  4. List available themes:"
echo "     unifytheme list"
echo ""
