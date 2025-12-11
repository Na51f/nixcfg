{ config, pkgs, inputs, outputs, lib, ...}: {
  imports = [
    ../common
    inputs.home-manager.nixosModules.home-manager
  ];

  boot.loader.systemd-boot.enable = true; # (for UEFI systems only)

  networking = {
    hostName = "loligo";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";

  programs.zsh.enable = true;

  users.users = {
    sqibo = {
      isNormalUser = true;
      description = "sqibo";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = [
        inputs.home-manager.packages.${pkgs.system}.default
      ];
	  shell = pkgs.zsh;
    };
  };

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users.sqibo =
      import ../../home/sqibo/${config.networking.hostName}.nix;
  };

  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = with pkgs; [
      firefox
      fuzzel
      git
      vim
      waybar
      wl-clipboard
    ];

    variables = {
      XDG_CONFIG_HOME = "$HOME/.config";
      ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
    };
  };

  services = {
    openssh.enable = true;
  };

  nix.settings.trusted-users = [ "root" "sqibo" ];

  system.stateVersion = "25.05";
}
