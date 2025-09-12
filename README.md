# Installing 
## clone this repo
```
git clone https://github.com/xexobi/nixos
cd nixos
```
# Rebuild nixos 
```
./bin/system-rebuild

```
## note this is my be take long time

# After finish 
## set password for default user
```
passwd dev
```
## then reboot system

# Setup user 
## first
login niri with dev user 

```
git clone https://github.com/xexobi/nixos
cd nixos

```

# Build home config 

```
nix run .#dev

```

