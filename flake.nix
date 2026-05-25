{
  description = "NixOS system with Home Manager and dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master"; # Follows unstable
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix

        # Home Manager module
        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # Automatically back up existing conflicting files (like .local/bin) to filename.backup
          home-manager.backupFileExtension = "backup";

          # Load your Home Manager config
           home-manager.users.dick = { ... }: { imports = [ ./home.nix ]; };
        }
      ];
    };
  };
}
