# flake.nix
# flake.nix
{
  description = "Shell para o projeto egui_grid com eframe/egui";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells = {
        inherit system;
        # O shell padrão
        x86_64-linux = {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.rustup
              pkgs.xorg.libX11
              pkgs.xorg.libXcursor
              pkgs.xorg.libXrandr
              pkgs.xorg.libXi
              pkgs.mesa
              pkgs.libGL
              pkgs.wayland
              pkgs.libxkbcommon
            ];

            shellHook = ''
              export RUST_BACKTRACE=1

              # Adiciona explicitamente os paths das libs X11 e GL
              export LD_LIBRARY_PATH="${pkgs.xorg.libX11}/lib:${pkgs.xorg.libXcursor}/lib:${pkgs.xorg.libXrandr}/lib:${pkgs.xorg.libXi}/lib:${pkgs.mesa}/lib:${pkgs.libGL}/lib:$LD_LIBRARY_PATH"

              echo "Use 'cargo run' dentro deste shell"
            '';
          };
        };
      };
    };
}

