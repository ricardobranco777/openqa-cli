
.PHONY: build
build:
	[ -f client.conf ] || echo "Create the file client.conf with openqa credentails. See README.md"
	cat client.conf > client.conf.tmp
	`./runtime.sh` build -t openqa-cli . || rm client.conf.tmp
	rm client.conf.tmp

