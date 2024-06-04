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

  boot.initrd.luks.devices."luks-dbdad372-cf1d-4dfa-91b9-07fb45befdae".device = "/dev/disk/by-uuid/dbdad372-cf1d-4dfa-91b9-07fb45befdae";

  networking.hostName = "nixos"; # Define your hostname.

}