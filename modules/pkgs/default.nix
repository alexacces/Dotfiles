{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ clang stylua nixfmt ];
}
