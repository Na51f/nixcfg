# Common configuration for all hosts

{ lib, inputs, outputs, ... }: {
  imports = [ ../../modules/common ];

  nix.settings.trusted-users = [ "root" "sqibo" ];

  nixpkgs.config.allowUnfree = true;
}
