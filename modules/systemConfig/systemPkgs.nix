{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.curl
    pkgs.firefox
  ];
}
