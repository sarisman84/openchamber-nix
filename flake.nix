{
  description = "OpenChamber with its bundled OpenCode CLI for x86_64-linux";

  inputs.upstream.url = "github:openchamber/openchamber/v2.5.0";

  outputs = { upstream, ... }:
    let
      system = "x86_64-linux";
      # The Bun dependency hash is specific to upstream's locked toolchain.
      pkgs = upstream.inputs.nixpkgs.legacyPackages.${system};
      openchamber = pkgs.callPackage ./package.nix {
        self = upstream;
        version = (builtins.fromJSON (builtins.readFile (upstream + "/package.json"))).version;
        opencodeCli = upstream.packages.${system}.opencode-cli;
      };
    in
    {
      packages.${system} = {
        inherit openchamber;
        default = openchamber;
      };
    };
}
