{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sbctl # used to create keys
  ];
}
