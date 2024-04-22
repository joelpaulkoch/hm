{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "joel";
  home.homeDirectory = "/home/joel";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      plugins = [
        { name = "tide"; src = pkgs.fishPlugins.tide.src; }
        { name = "plugin-git"; src = pkgs.fishPlugins.plugin-git.src; }
      ];
    };

    bash = {
      enable = true;
      initExtra = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    git = {
      enable = true;
      userName = "Joel Koch";
      userEmail = "joel@joelkoch.dev";
    };

    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "onedark";
        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
      };
      # languages = {};
    };
  };

  home.packages = with pkgs; [
    alacritty
    kitty

    neofetch
    fzf
    lazygit
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "hx";
  };

  home.shellAliases = {
    hm = "home-manager";

    hmup = "nix flake update ~/hm";
    hmsw = "home-manager switch --flake ~/hm";

    lg = "lazygit";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
