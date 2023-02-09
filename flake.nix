{
  inputs = {
    utils.url = "github:numtide/flake-utils";
    foundry.url = "github:shazow/foundry.nix/monthly"; # Use monthly branch for permanent releases
  };

  outputs = { self, nixpkgs, utils, foundry }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ foundry.overlay ];
        };
      in {

        devShell = with pkgs; mkShell {
          buildInputs = [
            jq
            foundry-bin
          ];

          # Decorative prompt override so we know when we're in a dev shell
          shellHook = ''
            export PS1="[dev] $PS1"
          '';
        };
      });
}
