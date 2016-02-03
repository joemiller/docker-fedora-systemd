VERSIONS := 22

build:
	@for i in $(VERSIONS); do \
		docker build -t joemiller/fedora-systemd:$$i -f Dockerfile.f$$i . ; \
	done

.PHONY: all
