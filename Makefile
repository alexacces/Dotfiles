.PHONY: user host
user:
	nix run .
host:
	sudo nixos-rebuild switch --impure --flake .
