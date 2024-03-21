{
  pkgs,
  outputs,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
    overlays = [outputs.overlays.unstable-packages];
  };
  home.username = "adri";
  home.homeDirectory = "/home/adri";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  imports = [
    ../../modules/home-manager/desktop
    ../../modules/home-manager/dev
    ../../modules/home-manager/zathura.nix
    ../../modules/home-manager/zsh.nix
  ];
  desktop.enable = true;
  dev.enable = true;
  zathura.enable = true;
  zsh.enable = true;

  fonts.fontconfig.enable = true;
  # TODO: move packages to their modules (if possible)
  home.packages = with pkgs; [
    alacritty
    gnome.adwaita-icon-theme
    gnomeExtensions.appindicator
    firefox
    mako
    libnotify
    waybar
    wlogout
    bitwarden
    telegram-desktop
    jetbrains-mono
    helvetica-neue-lt-std
    nerdfonts
    ifwifi
    wl-clipboard
    starship
    eza
    hyprpaper
    wlogout
    swaylock-effects
    swayidle
    imv
    mpv
    gnome.nautilus
    xwaylandvideobridge
    #rofi # for some reason if this package is installed you can't use plugins as there are some conflicts
    rofi-calc
    rofi-emoji
    rofi-rbw
    sway-contrib.grimshot
    playerctl
    imagemagick
    libreoffice
    inkscape
    unstable.discord
    gruvbox-gtk-theme
    nwg-look # just to take a look at themes, not to change them
    nurl # get "fetchFromGitHub" configurations
    xdg-user-dirs
    steam

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.sessionVariables = {
    GIT_EDITOR = "nvim";
    EDITOR = "nvim";
    VISUAL = "nvim";
    GDK_BACKEND = "wayland,x11";
    GTK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    GTK_THEME = "Gruvbox-Dark-B";

    TERMINAL = "alacritty";
    BROWSER = "firefox";
    VIDEO = "mpv";
    IMAGE = "imv";
    # OPENER = "xdg-open";
  };

  programs.home-manager.enable = true;
}