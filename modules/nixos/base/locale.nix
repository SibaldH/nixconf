{ self, ... }:

{
  flake.nixosModules.locales = { pkgs, lib, ... }: {
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LANGUAGE = "en_US.UTF-8";
        LANG = "en_US.UTF-8";
        LC_TIME = "nl_BE.UTF-8";
        LC_NUMERIC = "nl_BE.UTF-8";
        LC_IDENTIFICATION = "nl_BE.UTF-8";
        LC_MONETARY = "nl_BE.UTF-8";
        LC_ADDRESS = "nl_BE.UTF-8";
        LC_TELEPHONE = "nl_BE.UTF-8";
        LC_MEASUREMENT = "nl_BE.UTF-8";
        LC_NAME = "nl_BE.UTF-8";
        LC_MESSAGES = "en_US.UTF-8";
      };
    };
  };
}
