{ pkgs ? import <nixpkgs> { } }:

# The baryon-mcp release writes pkgs/baryon-mcp/default.nix. The guard keeps
# the repository evaluable while that file is absent.
pkgs.lib.optionalAttrs (builtins.pathExists ./pkgs/baryon-mcp) {
  baryon-mcp = pkgs.callPackage ./pkgs/baryon-mcp { };
}
