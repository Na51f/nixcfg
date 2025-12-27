{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Language servers
    python313Packages.pylsp-mypy
    lua-language-server
    typescript-language-server
    nil # Nix language server
  ];
}
