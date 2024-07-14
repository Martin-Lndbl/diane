{
  description = "Diane flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }@inputs:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          devShell = pkgs.mkShell {

            nativeBuildInputs = with pkgs; [
              pyright
              python311Packages.requests
              python311Packages.flask
            ];

            shellHook = ''
            '';
          };
        }
      );
}
