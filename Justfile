switch:
	@sudo nixos-rebuild switch --flake .#laptop |& nom

check:
	@nix flake check

update:
	@nix flake update
	@cd pkgs && nvfetcher

history:
	@nix profile history --profile /nix/var/nix/profiles/system

clean:
	@sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 2d

gc:
  @sudo nix store gc --debug
  @sudo nix-collect-garbage --delete-old

gitgc:
  @git reflog expire --expire=now --all
  @git gc --prune=now --aggressive

archive:
  @nix flake archive
