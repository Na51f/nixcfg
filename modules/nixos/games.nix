{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Game launchers
    # heroic
    lutris

    protonup-qt # GUI for custom Proton versions
    winetricks
  ];

  programs = {
    gamemode.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      # dedicatedServer.openFirewall = true;
    };
  };

  hardware.graphics.enable32Bit = true; # Required for epic

  # Set up esync (speeds up games)
  # systemd.extraConfig = "DefaultLimitNOFILE=524288"; # this currently does not work
  security.pam.loginLimits = [{
    domain = "sqibo";
    type = "hard";
    item = "nofile";
    value = "524288";
  }];
}
