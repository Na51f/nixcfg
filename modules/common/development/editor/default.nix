{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.nixCats.nixosModules.default ];
  environment.systemPackages = with pkgs; [
    neovim
  ];
  nixCats = {
    enable = true;
  };
}
