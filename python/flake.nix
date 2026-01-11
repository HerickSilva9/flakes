{
  description = "A Nix-flake-based Python development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell rec {
        
        packages = with pkgs; [
          python313
          uv
        ];
        
        env = {
          LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath packages}";
	      };

        # shellHook = ''
        # 
        # '';
      };
    };
}
