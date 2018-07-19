include global_rule.make

ROOTFS_DIR = target-root

all: build

config:
	@test -d $(ROOTFS_DIR) || sudo tar xzf $(ROOTFS_DIR).tgz -C .
	@$(CHMOD) +x mkrootfs.sh

build: config
	@echo "Enter your password to get the root privilege."
	@sudo echo dummy > /dev/null || \
        (echo "Get root privilege failure! Plz Ctrl-C."; exit 1) && \
        (echo "Get root privilege success."; sleep 1)
	@./mkrootfs.sh || exit 1

clean:
	sudo $(RM) -r $(ROOTFS_DIR)
	$(RM) $(RIMAGE)

help:
	@$(ECHO) "ARCH          = $(ARCH) [$(PLATFORM)]"
	@$(ECHO) "Cross Compile = `which $(CROSS)gcc`"
	@$(ECHO) "Kernel Image  = $(KIMAGE)"
	@$(ECHO) "Root-FS Image = $(RIMAGE)"
	@$(ECHO) ""

.PHONY: build config clean
