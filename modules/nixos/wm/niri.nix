{ config, pkgs, lib, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      alacritty
      firefox
      fuzzel
      mako
      waybar
      xwayland-satellite

      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      SDL_VIDEODRIVER = "wayland";
    };
  };

  programs.niri.enable = true;

  services = {
    dbus.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd ${pkgs.niri}/bin/niri";
          user = "greeter";
        };
      };
    };
    seatd.enable = true;
  };

  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    config.common.default = [ "gtk" ];

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  systemd.defaultUnit = "graphical.target";
}
