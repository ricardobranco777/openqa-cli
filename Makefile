
.PHONY: build
build:
	[ -f client.conf ] || echo "Create the file client.conf with openqa credentails. See README.md"
	podman build -t openqa-cli . --pull
