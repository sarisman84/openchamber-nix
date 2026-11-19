# OpenChamber for Nix

[![Nix flake](https://img.shields.io/badge/Nix-flake-5277c3?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org/) ![Platform: x86_64-linux](https://img.shields.io/badge/platform-x86__64--linux-4479c1?style=for-the-badge) [![License: MIT](https://img.shields.io/badge/license-MIT-yellow?style=for-the-badge)](./LICENSE)

[OpenChamber](https://github.com/openchamber/openchamber) is a web interface for managing OpenCode sessions. This flake packages it for 64-bit x86 Linux and bundles the matching OpenCode CLI, so you can run both with Nix.

## Setup

You need Nix on `x86_64-linux` with the `nix-command` and `flakes` features enabled.

### Run the web interface

```bash
nix run github:sarisman84/openchamber-nix -- serve --host 127.0.0.1 --port 3001 --foreground
```

Open <http://127.0.0.1:3001> in your browser. Press `Ctrl+C` in the terminal to stop the server. If another service already uses port `3001`, choose a free port in both the command and the URL.

### Install from another flake

Add this input to your `flake.nix`:

```nix
inputs.openchamber.url = "github:sarisman84/openchamber-nix";
```

In a Home Manager module that receives `inputs` and `pkgs`, add the package to `home.packages`:

```nix
home.packages = [ inputs.openchamber.packages.${pkgs.stdenv.hostPlatform.system}.openchamber ];
```

The `default` output is the same package. Installing it adds the `openchamber` command; configure a service on your host if you want it to start at login.

## Package maintenance

The [original recipe](https://github.com/sarisman84/nixos-flake/tree/06979fbbadd4c99357fd8b3c87eeab61afccfff1/users/spyro/modules/productivity/openchamber) uses a Bun dependency hash regenerated for OpenChamber v2.5.0. When updating [the flake](./flake.nix), verify [the dependency hashes](./hashes.json) against upstream’s locked Nixpkgs:

```bash
nix flake check
nix build .#openchamber
./result/bin/openchamber --version
```

## License

This project is licensed under the [MIT License](./LICENSE).
