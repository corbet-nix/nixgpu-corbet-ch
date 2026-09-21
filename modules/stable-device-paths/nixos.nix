# SPDX-License-Identifier: MIT OR Apache-2.0
# NixOS plane: hand the generated rules to services.udev.
{ lib, config, ... }:
let
  cfg = config.nixgpu.stableDevicePaths;
in
{
  config = lib.mkIf cfg.enable {
    services.udev.extraRules = cfg.rules;
  };
}
