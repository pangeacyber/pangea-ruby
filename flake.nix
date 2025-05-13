{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs-ruby.url = "github:bobvanderlinden/nixpkgs-ruby";
    nixpkgs-ruby.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-ruby,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      ruby = nixpkgs-ruby.lib.packageFromRubyVersionFile {
        file = ./.ruby-version;
        inherit system;
      };

      gems = pkgs.bundlerEnv {
        name = "gemset";
        inherit ruby;
        gemfile = ./Gemfile;
        lockfile = ./Gemfile.lock;
        gemset = ./gemset.nix;
        groups = ["default" "production" "development" "test"];
      };
    in {
      devShell = with pkgs;
        mkShell {
          buildInputs = [
            ruby
            bundix

            # For building debug > irb > rdoc > psych.
            libyaml

            # For Sorbet.
            watchman

            # For prism.
            nodejs_24
            corepack
          ];

          shellHook = ''
            export RUBY_VERSION="$(ruby -e 'puts RUBY_VERSION.gsub(/\d+$/, "0")')"
            export GEM_HOME="$(pwd)/vendor/bundle/ruby/$RUBY_VERSION"
            export BUNDLE_PATH="$(pwd)/vendor/bundle"
            export PATH="$GEM_HOME/bin:$PATH"
          '';
        };
    });
}
