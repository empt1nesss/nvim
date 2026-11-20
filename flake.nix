{
  description = "empt1nesss_'s neovim configuration"; # fork of deCort.tech's configuration

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
    };
    archlens = {
      url = "github:dc-tec/archlens.nvim/main";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        nixvim.follows = "nixvim";
      };
    };
    md-render = {
      url = "github:delphinus/md-render.nvim/v3.4.0";
      flake = false;
    };
    mmdr = {
      url = "github:1jehuang/mermaid-rs-renderer/v0.3.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      # neovim 0.13+ needed for multicursor
      # remove nightly overlay in future
    };
    remote-sshfs = {
      url = "github:nosduco/remote-sshfs.nvim";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-parts,
      pre-commit-hooks,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      flake.overlays.default = final: prev: {
        nixvim = self.packages.${final.stdenv.hostPlatform.system}.default;
      };

      perSystem =
        {
          system,
          pkgs,
          self',
          ...
        }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = {
              imports = [ ./config ];
              package = inputs.neovim-nightly.packages.${system}.default;
            };
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              archlens = inputs.archlens.packages.${system}.default;
              mdRender = inputs.md-render;
              mmdr = inputs.mmdr.packages.${system}.default;
              remoteSshfs = inputs.remote-sshfs;
            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
            pre-commit-check = pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                statix.enable = true;
                nixfmt.enable = true;
              };
            };
          };

          formatter = pkgs.nixfmt-tree;

          packages = {
            default = nvim;
          };

          devShells = {
            default = with pkgs; mkShell { inherit (self'.checks.pre-commit-check) shellHook; };
          };
        };
    };
}
