{
  description = "A Nix-flake-based Node development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell rec {
        
        packages = with pkgs; [
          nodejs_24
        ];
        
        # Environment variables available in the shell
        env = {
        # LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath packages}";
        };

        # Commands to run when entering the shell
        # shellHook = ''
        # 
        # '';
      };
    };
}
