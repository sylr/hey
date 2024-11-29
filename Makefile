.PHONY: build test release

build:
	@goreleaser build --skip=validate --clean

test:
	go test ./...

release:
	@goreleaser release --clean
