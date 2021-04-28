{ ... }: 

{
  homebrew = {
    enable = true;

    taps = [ 
      "d12frosted/emacs-plus"
    ];

    brews = [ 
      "emacs-plus@28"
      "git"
      "shellcheck"
    ];

    casks = [ 
      "rectangle"
      "insomnia"
    ];
  };
}