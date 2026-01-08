# unifytheme

A CLI tool that sets a consistent color scheme across terminal emulators and editors. Change your theme once, and it updates Ghostty, tmux, Neovim, and more.

## Supported Apps

- Ghostty
- tmux
- Neovim

> **Want support for another terminal or tool?** Contributions are welcome! See the theme format below and feel free to open a PR.

## Installation

```sh
git clone https://github.com/JHill6253/unifytheme.git
cd unifytheme
./install.sh
```

This installs:
- `unifytheme` CLI to `~/.local/bin/`
- Bundled themes to `~/.config/themes/themes/`

Make sure `~/.local/bin` is in your PATH:

```sh
export PATH="$HOME/.local/bin:$PATH"
```

## Usage

```sh
# List available themes
unifytheme list

# Set a theme
unifytheme set gruvbox-dark

# Show current theme
unifytheme get

# Show help
unifytheme help

# Re-initialize config (optional, for manual installs)
unifytheme init
```

## App Setup

### Ghostty

Add this line to your Ghostty config (`~/.config/ghostty/config`):

```ini
config-file = ~/.config/themes/generated/ghostty.conf
```

After changing themes, reload with `Cmd+Shift+,` (macOS) or `Ctrl+Shift+,` (Linux).

### tmux

Add this line to your tmux config (`~/.tmux.conf`):

```sh
source-file ~/.config/themes/generated/tmux.conf
```

After changing themes, reload with:

```sh
tmux source-file ~/.tmux.conf
```

### Neovim

Add this line to your Neovim config (`~/.config/nvim/init.lua`):

```lua
vim.cmd('colorscheme unifytheme')
```

The theme auto-reloads when you switch themes and re-enter Neovim or when the window regains focus.

## Bundled Themes

- `gruvbox-dark` - Gruvbox Dark
- `gruvbox-light` - Gruvbox Light
- `everforest-dark` - Everforest Dark
- `catppuccin-mocha` - Catppuccin Mocha
- `dracula` - Dracula
- `nord` - Nord

## Creating Custom Themes

Create a new file in `~/.config/themes/themes/`:

```sh
# ~/.config/themes/themes/my-theme.sh
NAME="My Custom Theme"

# Background/Foreground
BG="1a1a1a"
FG="ffffff"
CURSOR="ffffff"
SELECTION_BG="444444"
SELECTION_FG="ffffff"

# Normal colors (0-7)
BLACK="000000"
RED="ff0000"
GREEN="00ff00"
YELLOW="ffff00"
BLUE="0000ff"
MAGENTA="ff00ff"
CYAN="00ffff"
WHITE="ffffff"

# Bright colors (8-15)
BRIGHT_BLACK="666666"
BRIGHT_RED="ff6666"
BRIGHT_GREEN="66ff66"
BRIGHT_YELLOW="ffff66"
BRIGHT_BLUE="6666ff"
BRIGHT_MAGENTA="ff66ff"
BRIGHT_CYAN="66ffff"
BRIGHT_WHITE="ffffff"
```

Then apply it:

```sh
unifytheme set my-theme
```

## File Structure

```
~/.config/themes/
├── current                    # Current theme name
├── themes/
│   ├── gruvbox-dark.sh
│   ├── my-theme.sh
│   └── ...
└── generated/
    ├── ghostty.conf           # Generated Ghostty config
    ├── tmux.conf              # Generated tmux config
    └── theme.lua              # Generated Neovim colorscheme
```

## License

MIT
