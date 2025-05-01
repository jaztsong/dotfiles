# Dotfiles

Personal dotfiles configuration for Unix-like systems.

## Quick Start

1. Clone this repository:
```bash
git clone https://github.com/your-username/dotfiles.git
```

2. Update submodules:
```bash
./update_submodules.sh
```

3. Create symlinks:
```bash
./makesymlinks.sh
```

## Tmux Setup

1. Install dependencies (for macOS):
```bash
brew install libevent
```

2. Build tmux from source:
```bash
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
sudo make install
```

## Shell Configuration

To set zsh as your default shell:
```bash
sudo chsh -s $(which zsh)
```

## Components

- **Tmux**: Terminal multiplexer configuration
- **Vim**: Editor configuration and plugins
- **Zsh**: Shell configuration

## License

MIT
