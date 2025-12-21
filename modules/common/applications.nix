{ inputs, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    code-cursor
    equibop

    inputs.zen-browser.packages."${system}".default
  ];
}
