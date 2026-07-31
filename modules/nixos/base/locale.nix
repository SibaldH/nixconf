{ self, ... }:

{
  flake.nixosModules.base-locales = { pkgs, lib, ... }: {
    time.timeZone = "Europe/Brussels";

    console.keyMap = "be-latin1";

    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
	  LC_ADDRESS = "nl_BE.UTF-8";
	  LC_IDENTIFICATION = "nl_BE.UTF-8";
	  LC_MEASUREMENT = "nl_BE.UTF-8";
	  LC_MONETARY = "nl_BE.UTF-8";
	  LC_NAME = "nl_BE.UTF-8";
	  LC_NUMERIC = "nl_BE.UTF-8";
	  LC_PAPER = "nl_BE.UTF-8";
	  LC_TELEPHONE = "nl_BE.UTF-8";
	  LC_TIME = "nl_BE.UTF-8";
	};
    };
}
