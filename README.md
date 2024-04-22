# My Home Manager Config
1. Install nix: `https://github.com/DeterminateSystems/nix-installer`
2. Enable flakes
3. Clone this repo: `nix shell nixpkgs#git --command git clone git@github.com:joelpaulkoch/hm.git ~/hm`
4. Run home manager: `nix run home-manager/master -- switch --flake ~/hm`
