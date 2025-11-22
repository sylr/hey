.PHONY: build test release

HEY ?= hey

build:
	@goreleaser build --skip=validate --clean

test:
	go test ./...

release:
	@goreleaser release --clean

update-pgo:
	$(HEY) -profile -h2 -n 15000 -c 10 https://abstraction.fr/static/css/light.css && mv cpu.pprof h2.prof
	$(HEY) -profile -h3 -n 15000 -c 10 https://abstraction.fr/static/css/light.css && mv cpu.pprof h3.prof
	go tool pprof -proto h2.prof h3.prof > default.pgo
