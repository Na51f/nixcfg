{ config, pkgs, inputs, outputs, lib, ... }: {
  imports = [
    ../default.nix
	./hardware-configuration.nix
  ];
  
  networking.hostName = "loligo";

  environment.systemPackages = with pkgs; [

  ];
}
