{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in rec {
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; let
            devpython =
              pkgs.python3.withPackages
              (packages:
                with packages; [
                  attrs
                  cachetools
                  confluent-kafka
                  google
                  google-cloud-storage
                  httpx
                  protobuf
                  virtualenv
                ]);
          in [devpython pyright];
          buildInputs = with pkgs; [
            protobuf
          ];
        };
      }
    );
}
