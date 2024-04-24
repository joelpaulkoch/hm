# My Home Manager Config
1. Install nix from `https://github.com/DeterminateSystems/nix-installer`: `curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install`
2. Clone this repo: `nix shell nixpkgs#git --command git clone git@github.com:joelpaulkoch/hm.git ~/hm`
3. Run home manager: `nix run home-manager/master -- switch --flake ~/hm`
