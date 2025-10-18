{
  description = "indycave.xyz";

  inputs      = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs     = { self, nixpkgs, ... }:
    let system = "x86_64-linux";
        pkgs   = import nixpkgs { inherit system; };

        build  = with pkgs; [
          ocamlPackages.js_of_ocaml-ppx
          ocamlPackages.js_of_ocaml
          dune_3
          ocaml
        ];
    in {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
          buildInputs  = build;
          
          version      = "0.0.5";
          
          name         = "indycave.xyz";

          src          = self;

          installPhase = ''
          runHook preInstall
          mkdir -p $out/bin
          cp _build/install/default/bin/web $out/bin
          runHook postInstall
          '';
          
          buildPhase  = ''
          runHook preBuild
          dune build
          runHook postBuild
          '';
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = build;
      };
    };
}
