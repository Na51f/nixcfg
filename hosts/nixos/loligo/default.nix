{ config, pkgs, inputs, outputs, lib, ... }: {
  imports = [
    ../
	./hardware-configuration.nix
  ];
}
