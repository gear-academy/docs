.PHONY: all clean open

all:
	@echo ──────────── Sync repos ───────────────────────
	@./scripts/sync.sh
	@echo ──────────── Build docs ───────────────────────
	@RUSTDOCFLAGS="--enable-index-page -Zunstable-options" cargo +nightly doc --workspace --no-deps
	@cp -f images/logo.svg target/doc/rust-logo.svg

clean:
	@echo ──────────── Clean ────────────────────────────
	@rm -rvf dapps target

open: all
	@cargo +nightly doc --workspace --no-deps --open
