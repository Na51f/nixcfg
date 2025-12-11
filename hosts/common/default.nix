# Common configuration for all hosts

{ lib, inputs, outputs, ... }: {
  imports = [ ../../modules ];

  users.users = {
    sqibo = {
      isNormalUser = true;
      description = "Main user.";
      extraGroups = [ "wheel" "networkmanager" "audio" ];
    };
  };

}
