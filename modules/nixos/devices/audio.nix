{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    pwvucontrol
    alsa-utils
  ];
  hardware.pulseaudio.enable = false; # Disable PulseAudio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
