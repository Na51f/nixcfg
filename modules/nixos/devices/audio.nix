{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    pwvucontrol
  ];

  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        extraConfig."90-fifine" = {
          "node.rules" = [{
          matches = [{ "node.name" = "alsa_input.usb-MV-SILICON_fifine_SC3_20190808-00.pro-input-0"; }];
            actions.update-props = { "node.suspend-on-idle" = false; };
          }];
        };
      };
    };
  };
}
