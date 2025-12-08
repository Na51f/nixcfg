{ config, pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true; # (for UEFI systems only)

  networking = {
	hostName = "loligo";
	networkmanager.enable = true;
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";

  users = {
	users.sqibo = {
	  isNormalUser = true;
	  description = "sqibo";
	  extraGroups = ["networkmanager" "wheel"];
	  packages = with pkgs; [];
    };
	defaultUserShell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
	zsh = {
	  enable = true;
	  autosuggestions.enable = true;
	  syntaxHighlighting.enable = false;
	};
  };

  environment = {
	systemPackages = with pkgs; [
	  alacritty
	  code-cursor-fhs
	  firefox
	  fuzzel
	  fzf
	  ghostty
	  git
	  neovim
	  tree
	  vim
	  waybar
	  wl-clipboard
    ];
	variables = {
	  XDG_CONFIG_HOME="$HOME/.config";
	  ZDOTDIR="$XDG_CONFIG_HOME/zsh";
	};
  };
  services = {
#	sshd.enable = true;
#	openssh = {
#	  enable = true;
#	  settings.PermitRootLogin = "no";
#	  allowSFTP = true;
#	};
  };

  nix.settings = {
	trusted-users = ["root" "sqibo"];
  };

  system.stateVersion = "25.05";
}
