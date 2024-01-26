{
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          devShells.default = with pkgs;
            mkShell {
              buildInputs = [
                nixpkgs-fmt
                protoc-gen-go-vtproto
                protoc-gen-go
                buf
              ];
            };
        }
      );
}
