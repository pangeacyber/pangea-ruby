{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs-ruby = {
      url = "github:bobvanderlinden/nixpkgs-ruby";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ruby-nix.url = "github:inscapist/ruby-nix";

    bundix = {
      url = "github:inscapist/bundix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-ruby,
    ruby-nix,
    bundix,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [nixpkgs-ruby.overlays.default];
      };
      rubyNix = ruby-nix.lib pkgs;
      ruby = pkgs."ruby-3.2.8";

      gemset =
        if builtins.pathExists ./gemset.nix
        then import ./gemset.nix
        else {};

      bundixcli = bundix.packages.${system}.default;

      # Use these instead of the original `bundle <mutate>` commands.
      bundleLock = pkgs.writeShellScriptBin "bundle-lock" ''
        export BUNDLE_PATH=vendor/bundle
        bundle lock
      '';
      bundleUpdate = pkgs.writeShellScriptBin "bundle-update" ''
        export BUNDLE_PATH=vendor/bundle
        bundle lock --update
      '';
    in rec {
      inherit
        (rubyNix {
          inherit gemset ruby;
          name = "pangea-ruby";
          gemConfig = pkgs.defaultGemConfig;
        })
        env
        ;

      devShell = pkgs.mkShell {
        buildInputs =
          [
            env
            bundixcli
            bundleLock
            bundleUpdate
          ]
          ++ (with pkgs; [
            # For building debug > irb > rdoc > psych.
            libyaml

            # For Sorbet.
            watchman

            # For prism.
            nodejs_24
            corepack
          ]);

        shellHook = ''
          export RUBY_VERSION="$(ruby -e 'puts RUBY_VERSION.gsub(/\d+$/, "0")')"
          export GEM_HOME="$(pwd)/vendor/bundle/ruby/$RUBY_VERSION"
          export BUNDLE_PATH="$(pwd)/vendor/bundle"
          export PATH="$GEM_HOME/bin:$PATH"
        '';
      };
    });
}
