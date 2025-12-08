{
	description = "Niri Nix Configuration";

	outputs = { self }: {
		programs.niri.enable = true;
		
		environment.systemPackages = with pkgs; [
		
	}

}
