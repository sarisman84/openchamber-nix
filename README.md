# openchamber nix

Build [OpenChamber](https://github.com/openchamber/openchamber) for `x86_64-linux` with its matching OpenCode CLI:

```sh
nix build github:sarisman84/openchamber-nix
./result/bin/openchamber --version
```

To install it from another flake, add `inputs.openchamber.url = "github:sarisman84/openchamber-nix";` and use `inputs.openchamber.packages.x86_64-linux.openchamber`. The `default` output points to the same package. Consumers configure their own service and listening address.

The recipe and dependency hashes were extracted from [nixos-flake at `06979fb`](https://github.com/sarisman84/nixos-flake/tree/06979fbbadd4c99357fd8b3c87eeab61afccfff1/users/spyro/modules/productivity/openchamber). The Bun dependency hash was regenerated for v2.5.0 using upstream's locked Nixpkgs. When upgrading, check the hash with that toolchain before publishing.
