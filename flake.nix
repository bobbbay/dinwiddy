{
  description = "N-dimensional arrays for Idris 2";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.idris2-pkgs.url = "github:claymager/idris2-pkgs";

  outputs = { self, nixpkgs, idris2-pkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-darwin" "x86_64-linux" "i686-linux" ] (system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ idris2-pkgs.overlay ]; };
        inherit (pkgs.idris2-pkgs._builders) idrisPackage devEnv;

        dinwiddy = idrisPackage ./. { };
        runTests = idrisPackage ./test { extraPkgs.dinwiddy = dinwiddy; };
        examples = idrisPackage ./examples { extraPkgs.dinwiddy = dinwiddy; };
      in
      {
        # Since Dinwiddy is a library, the default package should just be tests.
        defaultPackage = runTests;

        # But we still expose the dinwiddy package as an available one, for
        # those interested.
        packages = { inherit dinwiddy runTests examples; };

        devShell = pkgs.mkShell {
          buildInputs = [ (devEnv dinwiddy) ];
        };
      }
    );
}
