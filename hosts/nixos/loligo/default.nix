{ config, pkgs, inputs, outputs, lib, ... }: {
  imports = [
    ../default.nix
	./hardware-configuration.nix
  ];
  
  networking.hostName = "loligo";

  hardware.bluetooth = {
    enable = true;
	powerOnBoot = true;
  };

  security.rtkit.enable = true;

  services = {
	pulseaudio.enable = false;
    pipewire = {
	  enable = true;
	  alsa.enable = true;
	  alsa.support32Bit = true;
	  pulse.enable = true;
	  wireplumber.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [

  ];
}
