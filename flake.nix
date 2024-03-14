{
  description = "grpc haskell flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux"; # TODO: support other devices
      pkgs = nixpkgs.legacyPackages.${system};
      haskellPackages = pkgs.haskellPackages;
    in
    {
      devShells.${system}.default = haskellPackages.shellFor {
        packages = _:[];
        nativeBuildInputs = [
          haskellPackages.cabal-install
          haskellPackages.haskell-language-server
          pkgs.zlib
          pkgs.grpc
        ];
      };
    };
}
