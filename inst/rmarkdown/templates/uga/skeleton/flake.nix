{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in
  {

    packages.x86_64-linux.thesis = with pkgs;
    stdenv.mkDerivation {
      name = "thesis";
      src = ./.;
      buildInputs = [
        gnumake
        texlive.combined.scheme-full
      ];
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.thesis;

  };
}
