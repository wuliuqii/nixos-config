switch:
	@sudo nixos-rebuild switch --flake .#laptop |& nom

check:
	@nix flake check

update:
	@nix flake update
	@cd pkgs && nvfetcher

history:
	@nix profile history --profile /nix/var/nix/profiles/system

gc:
	@sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 2d

	@sudo nix store gc --debug

archive:
  @nix flake archive
