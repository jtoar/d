{ config, pkgs, ... }: 

{
  # Custom darwin-configuration.nix location
  environment.darwinConfig = "$HOME/d/darwin-configuration.nix";

  environment.variables = {
    DENO_INSTALL = "$HOME/.deno";
    # doom emacs
    DOOMDIR = "$HOME/d/doom";
    EDITOR = "vim";
    # Use bat for man pages
    # https://github.com/sharkdp/bat#man
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };

  environment.systemPath = [ 
    # doom
    "$HOME/.emacs.d/bin"
    "$DENO_INSTALL/bin"
  ];

  environment.shells = [ 
    pkgs.fish
    pkgs.zsh
  ];

  environment.shellAliases = {
    drs = "darwin-rebuild switch";
  };

  environment.interactiveShellInit = ''
    # rust
    . "$HOME/.cargo/env"
  '';

  environment.systemPackages = with pkgs; [ 
    vim
    bat
    ripgrep
  ];

  imports = [
    ./homebrew/homebrew.nix
    # Shells
    ./fish/fish.nix
    ./zsh/zsh.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
