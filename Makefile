.PHONY: user host
all:
	echo "Hello world"
user:
	nix run .
host:
	sudo nixos-rebuild switch --impure --flake .
