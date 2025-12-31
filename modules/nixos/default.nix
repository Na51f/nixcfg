{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../common
    ./devices
    ./niri.nix
    ./security.nix
  ];

  programs = {
    zsh.enable = true;
    yazi.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
}
