{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./development
    ./zen-browser.nix
  ];

  environment.systemPackages = with pkgs; [
    equicord
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];
}
