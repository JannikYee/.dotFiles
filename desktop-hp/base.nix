# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../top.nix
  ];

  networking.hostName = "nixos-desktop-hp"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.firewall.allowedTCPPorts = [24800]; #Barrier freigabe

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  users.users.jasmine = {
    isNormalUser = true;
    description = "Jasmine";
    extraGroups = [ "networkmanager"];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
}
