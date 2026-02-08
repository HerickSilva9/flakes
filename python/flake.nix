{
  description = "A Nix-flake-based Python development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell rec {
        
        packages = with pkgs; [
          uv  # Let uv manage the Python version
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