{ pkgs ? import <nixpkgs> { } }:

# Each release writes its package under pkgs/. The guards keep the
# repository evaluable while generated package files are absent.
pkgs.lib.optionalAttrs (builtins.pathExists ./pkgs/baryon-mcp) {
  baryon-mcp = pkgs.callPackage ./pkgs/baryon-mcp { };
} // pkgs.lib.optionalAttrs (builtins.pathExists ./pkgs/magnetowid) {
  magnetowid = pkgs.callPackage ./pkgs/magnetowid { };
} // pkgs.lib.optionalAttrs (builtins.pathExists ./pkgs/telesfor) {
  telesfor = pkgs.callPackage ./pkgs/telesfor { };
}
