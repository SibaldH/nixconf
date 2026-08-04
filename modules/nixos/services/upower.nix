{ self, input, ... }:

{
  flake.nixosModules.services-upower = {
	pkgs, config, ... }:
	{
	    services.upower.enable = true;
	};
}
