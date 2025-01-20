{ pkgs ? import <nixpkgs> {} }:

let
  zigpkgs = import (
    fetchTarball {
      url = "https://github.com/mitchellh/zig-overlay/archive/master.tar.gz";
      sha256 = "1nyk5n86fjbqhx8yvhys9gyq4y9fv16vkm8p99cx7v6lqx1wbshk"; # You'll need to add the correct sha256 after first attempt
    }
  ) {};
in
pkgs.mkShell {
  buildInputs = [
    zigpkgs.master # This gets the master version of Zig
  ];

  shellHook = ''
    zsh
    echo "Zig development environment loaded"
    zig version
  '';
}
