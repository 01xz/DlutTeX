{
  description = "Dlut Tex";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        deps = with pkgs; [
          texlive.combined.scheme-full
          gnumake
        ];
      in
      {
        devShells.default = pkgs.mkShell { buildInputs = deps; };
      }
    );
}
