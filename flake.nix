{
  description = "archbox: minimal NixOS config replicating daily-driver CachyOS setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # DankMaterialShell - not in nixpkgs, provides its own home-manager module.
    # verify repo/output names against current DMS docs, this moves fast.
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, dms, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.archbox = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/archbox/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.xatrizy = import ./home/xatrizy/default.nix;
          }
        ];
      };
    };
}
