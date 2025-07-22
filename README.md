# ❄️ NixOS Configuration

Welcome to my NixOS configuration built for efficiency and aesthetics. This setup provides a modern, declarative system configuration using NixOS and Home Manager.

> **Note**: This configuration is a fork of [Andrey0189's nixos-config-reborn](https://github.com/Andrey0189/nixos-config-reborn), adapted and customized for my personal setup.

![screenshot](./screenshots/screenshot1.png)

## ✨ Features

- 🖥️ **Multiple Hosts Support**: Easy to configure for different hosts.
- 🎨 **Stylix Theming**: Consistent theming across all applications.
- 🪟 **Hyprland + Waybar**: Modern Wayland compositor with customizable status bar.
- 🏠 **Home Manager Integration**: Comprehensive user environment management.
- 🧇 **Tmux**: Terminal multiplexer with custom keybindings (Disabled).
- 🌟 **Zsh + Starship**: Modern shell with beautiful prompt and aliases.
- 📦 **Flake-based Configuration**: Reproducible and declarative system management.
- 🔧 **Modular Design**: Well-organized configuration modules for easy customization.

## 🚀 Installation

To get started with this setup, follow these steps:

1. **Install NixOS**: If you haven't already installed NixOS, follow the [NixOS Installation Guide](https://nixos.org/manual/nixos/stable/#sec-installation) for detailed instructions.
2. **Clone the Repository**:

	```bash
    git clone https://github.com/lagre/nixos-config-lagre
    cd nixos-config-lagre
    ```

3. **Copy the laptop host configuration to set up your own**:

    ```bash
    cd hosts
    cp -r laptop <your_hostname>
    cd <your_hostname>
    ```

4. **Put your `hardware-configuration.nix` file there**:

    ```bash
    cp /etc/nixos/hardware-configuration.nix ./
    ```

5. **Edit `hosts/<your_hostname>/local-packages.nix` if needed**:

    ```bash
    vim local-packages.nix
    ```

6. **Finally, edit the `flake.nix` file**:

    ```diff
    ...
      outputs = { self, nixpkgs, home-manager, ... }@inputs: let
        system = "x86_64-linux";
    --  homeStateVersion = "25.05";
    ++  homeStateVersion = "<your_home_manager_state_version>";
    --  user = "lagre";
    ++  user = "<your_username>";
        hosts = [
    --    { hostname = "laptop"; stateVersion = "25.05"; }
    ++    { hostname = "<your_hostname>"; stateVersion = "<your_state_version>"; }
        ];
    ...
    ```

7. **Rebuilding**:

    ```bash
    cd nixos-config-lagre
    git add .
    nixos-rebuild switch --flake ./#<hostname>
    # or nixos-install --flake ./#<hostname> if you are installing on a fresh system
    home-manager switch --flake ./#<username>
    ```

## 📁 Configuration Structure

```
├── flake.nix                 # Main flake configuration
├── flake.lock               # Locked dependencies
├── home-manager/            # Home Manager configuration
│   ├── home.nix            # Main home configuration
│   ├── home-packages.nix   # User packages
│   └── modules/            # Home Manager modules
├── hosts/                  # Host-specific configurations
│   └── laptop/            # Example host configuration
├── nixos/                 # NixOS system modules
│   └── modules/           # System configuration modules
├── screenshots/           # Configuration screenshots
└── wallpapers/           # Wallpaper files
```

## � Included Applications

### Desktop Applications
- **Browsers**: Brave, Chromium
- **Media**: MPV, OBS Studio, Telegram, Vesktop (Discord)
- **Productivity**: Anki, Obsidian, Teams for Linux
- **Development**: Cursor (Code editor)

### Development Tools
- **Languages**: Java (OpenJDK 23), Node.js, Python 3.11
- **Version Control**: Git with custom aliases
- **Terminal**: Alacritty with custom configuration

### CLI Utilities
- **System Monitoring**: bottom, btop, htop
- **File Management**: yazi, eza, tree
- **Media Tools**: ffmpeg, yt-dlp, mediainfo
- **Productivity**: fzf, ripgrep, silicon, grimblast

## �😎 Enjoy!

![screenshot](./screenshots/screenshot2.png)

## 🤝 Contributions

Feel free to fork the repository and submit pull requests if you'd like to contribute improvements. Open issues if you encounter any problems with the configuration or have ideas for new features.

## 📝 License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

