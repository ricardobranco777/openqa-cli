
.PHONY: build
build:
	[ -f client.conf ] || echo "Create the file client.conf with openqa credentails. See README.md"
	`./runtime.sh` build -t openqa-cli . --pull
