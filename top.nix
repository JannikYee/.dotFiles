# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  hardware.graphics = {
    enable = true;
    #driSupport = true;
    #driSupport32Bit = true;
  };

  # Enable the GNOME Desktop Environment.
  #services.displayManager.defaultSession = "cinnamon";
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "de";
    xkb.variant = "";
    
    displayManager.gdm.enable = true;

    desktopManager = {
      # Enable Gnome
      #xterm.enable = false;
      #xfce.enable = true;

      gnome = {
      enable = true;
      
      #extraGSettingsOverridePackages = [ pkgs.gnome.mutter ];
      #extraGSettingsOverrides = ''
      #[org.gnome.mutter]
      #experimental-features=['scale-monitor-framebuffer']
      #'';
      };
      # Enable Cinnamon
      # cinnamon.enable = true;
    };
    
    #displayManager.defaultSession = "xfce";
  #i3 Test wegen NVIDIA
#  windowManager.i3 = {
#     enable = true;
#      package = pkgs.i3-gaps;
#      extraPackages = with pkgs; [
#        dmenu
#        i3lock
#      ];
#    };
#
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jannik = {
    isNormalUser = true;
    description = "Jannik";
    extraGroups = [ "networkmanager" "wheel"];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Install Steam.
  programs.steam = {
    enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowBroken = true; #Kaputte Packete (Minecraft)

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  users.extraGroups.vboxusers.members = [ "jannik" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    #barrier
    chromium
    #ciscoPacketTracer7
    ciscoPacketTracer8
    discord
    dislocker
    #drawio
    fritzing
    git
    gptfdisk
    gnomeExtensions.tiling-assistant
    gnome-tweaks
    google-chrome
    gparted
    hunspell
    hunspellDicts.de_DE
    libreoffice-qt
    #minecraft
    mdadm
    neofetch
    nh
    obsidian
    #openfortivpn
    parted
    pavucontrol #grafisches Kontrollwerkzeug für PulseAudio.
    python3
    qpwgraph
    #steam
    structorizer
    sl
    tutanota-desktop
    #virtualbox
    vscode
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #vmware-horizon-client
    wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
