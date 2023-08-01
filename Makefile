all: run

build:
	@cargo +nightly build
release:
	@cargo +nightly build --release
build_micro:
	@cargo build --release --target thumbv7em-none-eabihf --no-default-features 
run: build
	@gcc -o test ./example/test.c ./target/release/libcortex_m4.a
	@./test
test:
	@cargo +nightly test -- --nocapture
bench:
	@cargo +nightly bench
clean:
	@rm -f test || true
